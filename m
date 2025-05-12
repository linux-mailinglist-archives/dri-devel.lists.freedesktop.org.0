Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF91AB3A1B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2F110E082;
	Mon, 12 May 2025 14:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVN4GnLw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B927610E082;
 Mon, 12 May 2025 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747059035; x=1778595035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mg1gHrIjdsZz+RfxZFwQO0S5RnqUNU76R5kFMRpYk00=;
 b=BVN4GnLwGKEqY+26tTecxlGQvSO8/rMTE0on7lmhcASPExpPLosvdcat
 VJa2KrucIq+oujygFZfxyJNIRGtA0JLHI16tHrEJwC4eKbgZik/ap7K0D
 gcESn4eGEhnrdOnpOsFjGAuEFfmhrdrPTSXt7C9o0xC4BSDPqNtrLMNCl
 Qik0GXHxOywBa8rprjpZTcHqPMZolo/uBxp2NI7GhZwlR5EXR6+pdqwiw
 1FdVBaRUKvx3YvkerNg1wj5ANl+/PuuuKqMYXX8GI11/hamWTSVPOO3rA
 vI5QhJo7QSKCuHYLYy9Urmd4mhZNygPym01cgLE3MdV5e6zvXXIqdgXnk g==;
X-CSE-ConnectionGUID: yO5DvSWATUaLSHP1G3Pd5g==
X-CSE-MsgGUID: 5dBEDxTATHGr+5KnU4MPUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36484676"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="36484676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:10:33 -0700
X-CSE-ConnectionGUID: fKPMY8p8ROuDvLDbH1XPuA==
X-CSE-MsgGUID: +cLHh/+wQD2mm3JvYo0kCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="141443780"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:10:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 07:10:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 07:10:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 07:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnTCeKqyjMOUEYjm3Qk73Q9NGSuBnGcWjEWSsaXUmuRQh5s848PTu5LWlTIM49EYqVDaAMtHZgR/KMsWEa08Lt3EbfsTntEcEhn6EOTDFze5adAeozWUY4/Bk0fip8Q0sCSCthsxXaQfM/871fYB9cd3NLSkXqn4hSnsQpQDR0/oC9Obls8c54bwuOJutcYb3kIzdJF/pBmN7+cA9SD5HLo8nfSpwtSS8lwJLJdmgBhZ8emmVnq3Lv4r6wXVH0idtFtXDtUofSKx9i0rn9QaYbvdtrPmkoYczGYQY34agn5+h3QS3s+HBENzBphRAPU/iYENnyI0hCIQKyKTiVuyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/YEBDGw9JGoebau1A33wGpECWS7B//AKJbEvFOQ4Bg=;
 b=RlliQU51cQrvW4GJQjMIzpMGl/8kpHdl0UBjIUa90nQrEAngOHCzua33U274EfxfeJbobo+yyYKbw0pp4H19VLwq8omED9FS3a8cL+fIpfGEhf+1Qj0HTks0/IqZtdLPfxwgKAiy532CydihNdbIc52n2WPJoB4i28Gw/l+FTwEKZOw/ulHSt2Mb7jEqam8c/qxCSMwZ3cx0+8wCrb6jqffHaYdBoBnHmSZDSBjiR9M1thegaWeDP/B8eDGm1LQYe6yxlbwE+6vPYeuA204XsJsNigCFm7qZOJ98w0nqY8USWy0G3JAzoWvfnc+rjSo1CfI6sNAz66tXT+WzzSH+9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 14:10:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 14:10:16 +0000
Date: Mon, 12 May 2025 07:11:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <amd-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <kernel-dev@igalia.com>
Subject: Re: [RFC v2 13/13] drm/xe: Make dma-fences compliant with the safe
 access rules
Message-ID: <aCIBnh6JS/JuZOcM@lstrano-desk.jf.intel.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-14-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250509153352.7187-14-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 228ed803-d973-433d-2c9b-08dd915eb82a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GMXbbtIyJ8NM7nF/cotdqUsvhlB+1kj6b1TufibvXIjBdXLJx6MuV8bDPoks?=
 =?us-ascii?Q?t6KIZtdiV84WSJlu0r9yDrnwcWsttx9OBRsX6gM9xkT59ULJ5gVn6oq7XZb3?=
 =?us-ascii?Q?8mLLrIZTQa0ivrmqm+/honx9wySDnqM8sw7V48BtVMkyYoJ/Cd1ZJa9Jfk7I?=
 =?us-ascii?Q?ZM02eaoHX6tO4YqzzakDE3BE+jVIVrm5ds816XyTw/8u1eByRYK4H825r0Jz?=
 =?us-ascii?Q?3S1hXt2FA3uTbsO3FE+dleJQjZuZ4WKy6wumcbYQg1s6cKemfzYzg6q3Ss1L?=
 =?us-ascii?Q?4kABheqloT6m6ixI8/krtjbGMGJttwjWC4hHponMupvlRHwJ1KIly7TdKQ9Z?=
 =?us-ascii?Q?CP+gltIs/EnIiMjB/5886rL52eHRBnBNPMYYKOLOg6aeJRAmeLwRFzj/cbrm?=
 =?us-ascii?Q?Q7zrFaT8TuqT4WqtXxjB4MKIbFk/FAAbVhBJMAUCCVNN2eK7DYnxt7jWthGe?=
 =?us-ascii?Q?inY4vk9oC0jpy2uL1sUIO7ry8lNLDkYadngFxvejlwj4X/4OQRJ27kI0j/0g?=
 =?us-ascii?Q?b3e7YGO9r20qhIvu5MU6jBNfW03hHZJtUTix6qYhxeku8OFEQt57wPZMgdTl?=
 =?us-ascii?Q?NcxeIGsJd/MQpH2sajri0XUDxnHUqlEgFT6vU4eZi2Fjn8xeFMcfDTycYQdn?=
 =?us-ascii?Q?dZTBFZHOgypOts5M2krFLj9rm6KC6um0I9bYwsFsKeMMlLeJMuTq/vdiKeEh?=
 =?us-ascii?Q?I0QXJImiIWu93krLU8n2yISRYjjO8qWj1v6JvKiv/RGr3L9CMtvTqjJJaj4j?=
 =?us-ascii?Q?xOWQ1J4B52x4rZFKxId7nCXFfa1gpw6BI53pkX3x+NwReTlKvxK7ZUMotncL?=
 =?us-ascii?Q?7mTwEJHvCOxPdrhKA1mPbu7ZIsOOTkCvmHvburyHJlitim73wWzC+LRDktai?=
 =?us-ascii?Q?j7elwRR9xJFMRb+Aq3AuSUatJqSCGqIJJdkPlJtZwKLGw4XtJq/tfDI1JrPr?=
 =?us-ascii?Q?S+WlJglb6Xwo6bj4RVO60SbHEsegX5ODGdWU8ArgyRC+2DJQRiTaSDyBCdTF?=
 =?us-ascii?Q?cu7ciEIlBA66erJOqh7KyXaDgWYqtt8+85rhEwmWHpm/nZEC9yGcAYYQoayA?=
 =?us-ascii?Q?LVaLuzEkOiTjAh7Xu/mY15eZJ2y88ZNbPr0g0ZvtE8yaPPiDamGz0rORm5Zy?=
 =?us-ascii?Q?6yQYc5RK1+yIuEUvw+XzA4X1+uFJFc/ynwSgvSDgg+kawmF3qnu5rnI70l1+?=
 =?us-ascii?Q?5ehkhsYoBvEK3hzLWdta6kDiPh94U5Mn/LjrYlgPt5pqhWROxJWEoVsLiLOz?=
 =?us-ascii?Q?kwHGM0L9eocDTrwAH3pt8KPBuGrzsIsmYRb+6xDfKzqbdE/Xol37PpbutrZw?=
 =?us-ascii?Q?TsAYdjqKTfnq4fhMLyopIG1fiUxMsDWQqmZP7oaWFn525i7OqN9hf8XBLAny?=
 =?us-ascii?Q?gjqL3Fu1kwGzstyvVKCS1AOb7yaYmK1K5w7JsTGeMnrr70d9/bflK0WBYKUZ?=
 =?us-ascii?Q?9ivw+iSjr1A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sDOwpliYUPiZTRgGmGAQr0ilbkMyhUOph52aVi5PHp4XK+IQhX0mkJSlqWUx?=
 =?us-ascii?Q?iFcGbKJDSLO8yIONe7WtopkU9h193Qo5bLOaFcmLEmhCYdCPyE0Ovmji2q0c?=
 =?us-ascii?Q?5q7KpMYkcrLd3hsY1Tzo3BC5ig5RwubaMC44VJS676BAghq/9N+H5EG2hqlG?=
 =?us-ascii?Q?i6SwgO6y78DQwPjPZ5t37BK83pFUWjsRjUOVpmD6q0PU+zv1AjS+C66TDaiD?=
 =?us-ascii?Q?vG1xakx3mtZJFwgyAUbBwAOptaX6Rin+Ok20nNw5+VD8L8dnFbDSazGOIlPv?=
 =?us-ascii?Q?TYSPRhbb/uh83lPtUWqErnbDsfaWNI48Cdg+fIK2LBGopsavpsA5KL4zuwZ+?=
 =?us-ascii?Q?sqcKbT3JBYUm8jfPAhXD4OI4bCPXmB2Rkfz326roxF9X9n1Kc31+6pREcgHC?=
 =?us-ascii?Q?YPDMI4v1EO2/Rgm/dkpRKNNqc1H650Y6leDFB2idxCpcAvrrRQ7VN0ksUGUR?=
 =?us-ascii?Q?UBIwEI4+rz3dciDQZD6wJwEtWOzklwQ86JhcSRgyPWWQL9/WIFWD5LZ1qFp6?=
 =?us-ascii?Q?o+n82Xv5CNLXlo8ixGupvHZ3gvob1alWNdrhGtBkcqBWT0HXG9OF9x/K1lgZ?=
 =?us-ascii?Q?NLD0Na9oqG7ZU3m741cPJJ8oMMp55yFZIrfZqHPE8dawYD1NDhEb6Kv07Ydu?=
 =?us-ascii?Q?T3tBQF/gpcmNppt74sSc/7OFw6AQcajBYVH5gtdHIZQvsyfaO4wikhsUtFav?=
 =?us-ascii?Q?Qi7hoHVpLBgOG5wiRsoPK79NMlUhjrNtNS+sXy+Ppmtn7tnuXeH0NWx457cS?=
 =?us-ascii?Q?Z7NVtMsDbxFsOi6zQUay59PhgK2TvHZzmJGCy7cit4ny2w+EQ1+DhOsplH9T?=
 =?us-ascii?Q?MW6kCaho/RXpyK+Rq/6aqInSx9yQy+U9/df3gp+vE0ROmhG8RlsFgPJvTtw6?=
 =?us-ascii?Q?AL+spV5Iw0/R3gTxcohcyYLJaZb1r+TjAmlP/DBuIbRf01cvV+ut8978mBfy?=
 =?us-ascii?Q?OBG3KZDgLMZ8aPxIvd14TvZpfRXohpw10waA6YTM3NHlK4cUPYHkpnHXReih?=
 =?us-ascii?Q?Xj+Z66oIlV+AmgrMTMCcTlZ7N24wLRn+NLuDNjHO/I+gwQBd0nizqjkiC7gr?=
 =?us-ascii?Q?g7aBdWevLlfRU4hPvqFQL6dhh9MIuonISsdSGbGKmXYrMsuNyBNwTo95QDWr?=
 =?us-ascii?Q?RvaYseESMQfh7Ab4RBN2194k+lZ/ATXmnS+r8PSOMoI2unEGmoqw0QSpmoHE?=
 =?us-ascii?Q?2bQOdGqVKvI5vHXxCSIfAW10lTWCPo6R/XgX13zxTnthGWY6oYLvstzu6cDG?=
 =?us-ascii?Q?5wdTQCfMyOAz2yyXFTdYNkZ8Zfg+Ccabmaq+8NWnK4cv75Xhws9mWVxnQGy9?=
 =?us-ascii?Q?pcuvKqc34sLVwemgRvXKZxs8hfzq9l31HtEnFoRBvWsJa0R0c/HKZZGQXTPp?=
 =?us-ascii?Q?2vT3X3jH4MWY43koFJtPVIuyBuR4OQa+9eJ9ry58q7IfHnqnBw2ABcl5HEMp?=
 =?us-ascii?Q?pfO2nMlJICBN0/vN9EX7fOicAQbooUseuW2p72RsYWoRgbV/NyFdqtK8CWrz?=
 =?us-ascii?Q?c1JtU1/aXQLXiOGRnu2y78wDqk2Q562l/D5Kj8FdIqFKXFGm0y43fR0nca8X?=
 =?us-ascii?Q?H31TX+vzBKHewhXshi80vEal4Wu2zorvLBcTjgGrz2O4u6FTlWc3ZqMF6jjM?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 228ed803-d973-433d-2c9b-08dd915eb82a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:10:16.1271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ILSTKoVc1HjbOMsekZDxoGOrISrhCUw7QZD9ZhjeCczb18kJ7h2XWztAopElkD56ON280072KxY4V4dbT4IUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Fri, May 09, 2025 at 04:33:52PM +0100, Tvrtko Ursulin wrote:
> Xe can free some of the data pointed to by the dma-fences it exports. Most
> notably the timeline name can get freed if userspace closes the associated
> submit queue. At the same time the fence could have been exported to a
> third party (for example a sync_fence fd) which will then cause an use-
> after-free on subsequent access.
> 
> To make this safe we need to make the driver compliant with the newly
> documented dma-fence rules. Driver has to ensure a RCU grace period
> between signalling a fence and freeing any data pointed to by said fence.
> 
> For the timeline name we simply make the queue be freed via kfree_rcu and
> for the shared lock associated with multiple queues we add a RCU grace
> period before freeing the per GT structure holding the lock.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

This makes sense in the context of the series (e.g. assuming patch #9 lands).

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 7 ++++++-
>  drivers/gpu/drm/xe/xe_hw_fence.c             | 3 +++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index 4c39f01e4f52..a3f421e2adc0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -20,6 +20,8 @@ struct xe_exec_queue;
>  struct xe_guc_exec_queue {
>  	/** @q: Backpointer to parent xe_exec_queue */
>  	struct xe_exec_queue *q;
> +	/** @rcu: For safe freeing of exported dma fences */
> +	struct rcu_head rcu;
>  	/** @sched: GPU scheduler for this xe_exec_queue */
>  	struct xe_gpu_scheduler sched;
>  	/** @entity: Scheduler entity for this xe_exec_queue */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 369be36f7dc5..cda837ff0118 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1274,7 +1274,11 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
>  	xe_sched_entity_fini(&ge->entity);
>  	xe_sched_fini(&ge->sched);
>  
> -	kfree(ge);
> +	/*
> +	 * RCU free due sched being exported via DRM scheduler fences
> +	 * (timeline name).
> +	 */
> +	kfree_rcu(ge, rcu);
>  	xe_exec_queue_fini(q);
>  	xe_pm_runtime_put(guc_to_xe(guc));
>  }
> @@ -1457,6 +1461,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	q->guc = ge;
>  	ge->q = q;
> +	init_rcu_head(&ge->rcu);
>  	init_waitqueue_head(&ge->suspend_wait);
>  
>  	for (i = 0; i < MAX_STATIC_MSG_TYPE; ++i)
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index 03eb8c6d1616..b2a0c46dfcd4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -100,6 +100,9 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);
>  	}
> +
> +	/* Safe release of the irq->lock used in dma_fence_init. */
> +	synchronize_rcu();
>  }
>  
>  void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
> -- 
> 2.48.0
> 
