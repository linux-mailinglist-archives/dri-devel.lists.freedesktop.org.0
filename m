Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60B9AF76A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 04:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0470D10E047;
	Fri, 25 Oct 2024 02:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hdSvupUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F65C10E047
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729823585; x=1761359585;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J56oW2ucjJSDMCO0tp7UmU3iRvN/FHONtvae16E7a44=;
 b=hdSvupUNyQxwPRAHow4X63DsxuuqK1X2mZ006LLvYsmBlYHXpy5pWTTU
 0yEGtlZAaTz+Uaitqzf43dlA39MXgnBVJqDTGuRb88mfsgge5ebkBTthZ
 oLwK+Pr/1ndcgVMDzFkihv6pVX6FWmb17Z086Fe6ZruolNlEZDowpi2Ma
 JPZA4niHsGeozYrzK80jJqRwx5UKRV/xMS69QIDdeYRvJBt/gvUWYvarI
 A9xS/Vv2DQhDP1LCEgjnHsyJyFkVacMA7OlS4TiBOsphHIwbPDm2cKijI
 ufXdR9QCln25LJ/xC+NUzELtDRqhdQ2y4/g0YV1fMJOl0nBpcSlj2tHSm g==;
X-CSE-ConnectionGUID: o4BWu42MSy2ukKLoPW93bA==
X-CSE-MsgGUID: DYbvwfSbRZmbsI0wn5swnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40100990"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="40100990"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 19:33:05 -0700
X-CSE-ConnectionGUID: 0MJxN2juQWutRrWVXRe8zw==
X-CSE-MsgGUID: W/JkOWAZRWCTbhPPisKuiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80886595"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 19:33:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 19:33:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 19:33:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 19:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIakM2KVE2JBp2txAL1AExH6UtAFQtAkkw2RfuVQ1xGlRYVkJrA4I+uiS0zczmFD3esbmAFPtAaX0eiulcpUzf8uGVjD1UUdUCyhQFMgyR6iqHeCtPT7Xm0l7eQ+PB2Qz1dCUvSW8aXgVe7lEaPyOmSq1jlFtWz3nQZCJMSVKQg6yFlhF1/I/wGBP2LAthUD64YvsrMDDfRuh8il7moosUnBNfmFLvSK8r8tKIpEyDCKVIKEeRfhctzoLv2//jxoIL98l9ch73ETNqPEiHqHnNH7Ct210mvABe8MvS/G0mJ/euHJmp3wuRETzx354JpHvC242kdftn5jUu+7vFwzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvD7zQbb6P3vNLSkc70KWc6X5uNkY42Mosr/iNZlIRk=;
 b=f/X21JurZ9xuv0REoltFHJATQeSuqSsWgzwDjbn6Zn9qt8J7aQaJmT1bKcdR6S/xLq/uPEEwRMDplk7GmKIoplYp+2BnvF6U4dHa8QWD/8p1v3syfL579WKETrcbV4iamc5/epKUgKv1cqziZadzDGcuHCxx3GtivRfV0A48eWdN3nWs0U4Ek+QncuxpioPeB+XTCcy3LUQ8+jQkIm6jDntc0k7FBXxIXz68CI156DJt+4kOv/SQ+k18mSCOLlnXLWbvZYvA2lj0PpaUJqGRi86cF9PIKOq3R3N5Ugwg5fqtQqLt1PVeIkE5hHxVezoP8g2NF/cydv/GF5HSUlGSEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 02:33:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:33:00 +0000
Date: Fri, 25 Oct 2024 02:32:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Luben Tuikov <ltuikov89@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/sched: warn about drm_sched_job_init()'s partial init
Message-ID: <ZxsDRWxVRt2fCKpF@DUT025-TGLU.fm.intel.com>
References: <20241023141530.113370-2-pstanner@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241023141530.113370-2-pstanner@redhat.com>
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 246b351b-db6d-4058-f79b-08dcf49d5825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?77HtRSa7VXG4hKbR8NomuXvQTspoEhpN3jejaip8SHKoPB30imW5/vkoD0O9?=
 =?us-ascii?Q?0VqZ+VXs2tMmhjo8liBBJB89w2OQRA6LN4rPI07AmepXXYArEbZU7+IBXAKc?=
 =?us-ascii?Q?POm+wxAG3lQrC+1Oi03Z2+c15ClM5cb01BsSp65jws8gZm5mFKItCajo+8La?=
 =?us-ascii?Q?G2tWF/5EKFL9AP5ynJsyubphc9UdQVJr5QYOdHV5qVNbk1CXRbvFeoTmWlKX?=
 =?us-ascii?Q?UOHPgQdFDInHk1Rm8rKNoAnL+ugtKLyI86IYrv26mwAgaceaktWX2A0MSGrr?=
 =?us-ascii?Q?/uLivpRTTV2LgEYEYynrdyf8MPD9qvD34i7gzpPpGBFoIPhxD0J0mKpEKd6e?=
 =?us-ascii?Q?GjpXdlWxkZ46yj6RxWEVbAlyWFby3k+V8X2Tt5J1grJ7MZNFnxUu9MfmCjAm?=
 =?us-ascii?Q?cNUvHx2jMqvOQU5zdyC0GEmZ2CrbtK2H8sEK7G1/7tmHRztCkPqCNJk3WZo1?=
 =?us-ascii?Q?d4I//m8Nt7opn/ekbAPNPX1G7u047mkzSvvcpAfAjHjYthn899SVNRJmmBJ8?=
 =?us-ascii?Q?y7s/Z2w4VS8f/FDkfqo8uvHUYvod2uvlTnJId1KnlNGDZL2qf9euqMC+1nZ2?=
 =?us-ascii?Q?/jHG0iE6TPZJUVA60WmONG3SlxYq1HnlCupQpuRFPDqbqCkYZUz9Pl1RTre7?=
 =?us-ascii?Q?vjaYSYzsQD4sn4ov/HUH6njHmk/RiffUdKXXOI0Obwh0sIBBvsyR+Rcyimxh?=
 =?us-ascii?Q?kmqoNx/HMOlY2tDxgzYRj6pgwRs/mu79wexVxgEKLOxJ8kbkHlvk05BYiY9Y?=
 =?us-ascii?Q?TsjUEmpWBsT2x6hxjTj3KTsxuzvVtMyl+odYJ9jUsbS9qE8lKER+wXDe5Tsz?=
 =?us-ascii?Q?R/tEoKYCyimNKQL2QOVDonyy6TCqQBaZ7WDIk3SR8+WUiIIaoy3EZwA4OJAK?=
 =?us-ascii?Q?gJ3bU2DyH4GKlDBs3Q4IxxiAdYD/hZefhXXU1M8zU3XhNyQ+JD1kg/90AL47?=
 =?us-ascii?Q?k74DGVR3t4Tq2qrZwQjj7ZlCsUr4FBfm0E87bXSUvh2hAEOXsWWJnLT6uW3j?=
 =?us-ascii?Q?ulqYWI7uyrNIsLgroivz2wOjeA28pzembtqRPVToMd2M1Ba/79KDVONx4QWG?=
 =?us-ascii?Q?WLHdx+QxdalQPEUAgnwJllt3kPXaMc5WrfvwcbgAIALs9tyQoFDq3VsvtYux?=
 =?us-ascii?Q?OKxXhXz5gq7D47vwYSvDUatjWkCWa6+1pay4axH7mxM5OBvSmjl8Sgv284zv?=
 =?us-ascii?Q?PI5GeWqJr/C9Y3Qj/Fl2+ZV/90Hqg+IX2xReOp9yE4t3xiYC+79oIBI8mA2A?=
 =?us-ascii?Q?ANn8GjUi49oTOImwK5MLM8nhBkn7dvP7mm5D8EyDa4U93DTPK8xK6FZrQKe8?=
 =?us-ascii?Q?MbrwEoZ3LzOMJxgCC/uqVAJD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0wxyWo1PN9i6ydissN5q0ibATIXxoYByI9iZozXWr3+mwPClHJK43MgwIyMA?=
 =?us-ascii?Q?d13pPWe/xe413xTLmYjnt+VjfuREpMVvRdgVCOldx/IjUDS+cEq/0ssgDua8?=
 =?us-ascii?Q?+Gw7XA/oKifYuBh5UTp2W3wlbqEFv23UelCAVCrLxI3rspmwvSxZNA8URJZX?=
 =?us-ascii?Q?W5iz0LEyZaKjm0tV9qa1h6qhbsWU83mQ5IJgFaJNWuy8/z9sI7x6LDYvHI2M?=
 =?us-ascii?Q?naKSjz/OtRzG5UH/pA6sLP3ukLOqOXefkGVGqlXCLzS+sTrchoixF/T64wzZ?=
 =?us-ascii?Q?Jo6j5alObOia2daMsH3g7MeUE6ajTlP3vHzDYRSn2YcKFNEqMK2b7c+2EnP9?=
 =?us-ascii?Q?uoneF23IulLF2d5lvH9qTiZbO5gFqB176cIxlf0td4rogeeEeys1oCi4QyVr?=
 =?us-ascii?Q?Cg3ATwsK7ba/Epl+3vSL1f3c7eteOYVAm3vYXWCCuMaTABlN7MEZg2wH23Yr?=
 =?us-ascii?Q?Ysh5k88JlZya6t6ZQzKQc8WKOUMcPT/6gMYKLw1r5LED0TiIgfelL/thqdHj?=
 =?us-ascii?Q?IKT7iOlvvMIm7n7969/8UldC5++SLwNrP6LUBAFyKbbp9PFBelQzmIYC7jww?=
 =?us-ascii?Q?E4jpsl8+pocGmfOomlRO7QIGox223/WlufZaZ2I6tNmYmxSm/5YxZXiPGVVt?=
 =?us-ascii?Q?uTZosx/O+stohP40iWKHg8STI7/PGEqyUnOhBewNTIgepsPg/UY7gvGTClwk?=
 =?us-ascii?Q?uPkHYLNzT1NdPxYiLX9n2MvgjHPgbyalv44+utTyYInUE7QtazPc9BeRYiRS?=
 =?us-ascii?Q?we/dkfunsov/QydiehS2w93M/6y1IDcylZbTe+0pc0etLmJVL0AlkCQS+Ffw?=
 =?us-ascii?Q?eOE2mWtq0HvkBTGejQSBXbJyntcUTwC2OpjAHNMiSczjfnD9EcTcpzKWEx2P?=
 =?us-ascii?Q?pC3mPc6YOtyH3Ux8yYPFejoHMUyNWWr9cn9xOJq+1OJcvaqgOOR8Wvu/9zBT?=
 =?us-ascii?Q?CMVHE3XxCxSV09i30odH16OCkJ+yZ4VAlHli/+XVVDX2AVo2Z7P1o3owqj8V?=
 =?us-ascii?Q?ppi4veB9cnZ0FR9D2Q1cvXbLeD8/lGEsS5ZtJocK31/fdREBGE9ddfTEYiCY?=
 =?us-ascii?Q?2TaQYOdbMhoES/Ll9CGFfNd5bVDUHK6XZdu/l3CvcNZrsQz1s4Era6y2ojx7?=
 =?us-ascii?Q?Rm+aJu9JCegLDleZ/U8WOVScJ4eEXa9KzRCU/6aup+HUl9qZnxXunpvN/+SX?=
 =?us-ascii?Q?DKlEKyppAY5efYlXVWWk/ls53sR3Q2x3ajX4gvjuhvqqVWwEZxKh5gOdXIw0?=
 =?us-ascii?Q?EQoSixJMUqfPBmg1Pt8Cb+dwHxtqBFifF3r6OKLBgUQLk+XthamN4WUyvqV4?=
 =?us-ascii?Q?yOKXIoUw1w6z45fJudjab5vqLYacnis283ZcwKr8Bodl5a7XgeFi6HPMaj8j?=
 =?us-ascii?Q?B99JrMBrSDWcjrcR48xeTgBVIDkAn+kvus64OL+9NLf5iikEAV4uDJ4la/bz?=
 =?us-ascii?Q?LtysnXX272YqM8cppSv27yoXCFtsVDndUVdUwwFjkJFSCzpvl3QXXYSs4i0i?=
 =?us-ascii?Q?N3xXGDwenrlxdinCkdkdSEkCpB0uAwipI7fAAoB17voFv9APC4BREPXM1nsG?=
 =?us-ascii?Q?Xggfxzg01aQv6Uy/9T/Yq29euH0sXiGgI0NX/LnYYO1Idjr5LgTU0Pvxurph?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246b351b-db6d-4058-f79b-08dcf49d5825
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:33:00.6925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnXalbTL+IDUbBoFJAOi/n/ksKltlNANZlIsLOkSiiaKrcejiiDbi5Fz+hzdJiXQpWtieNNbq2vbc47UGlbFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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

On Wed, Oct 23, 2024 at 04:15:31PM +0200, Philipp Stanner wrote:
> drm_sched_job_init()'s name suggests that after the function succeeded,
> parameter "job" will be fully initialized. This is not the case; some
> members are only later set, notably drm_sched_job.sched by
> drm_sched_job_arm().
> 
> Document that drm_sched_job_init() does not set all struct members.
> 
> Document the lifetime of drm_sched_job.sched.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++++
>  include/drm/gpu_scheduler.h            | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index dab8cca79eb7..8c1c4739f36d 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -771,6 +771,10 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>   * Drivers must make sure drm_sched_job_cleanup() if this function returns
>   * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>   *
> + * Note that this function does not assign a valid value to each struct member
> + * of struct drm_sched_job. Take a look at that struct's documentation to see
> + * who sets which struct member with what lifetime.
> + *
>   * WARNING: amdgpu abuses &drm_sched.ready to signal when the hardware
>   * has died, which can mean that there's no valid runqueue for a @entity.
>   * This function returns -ENOENT in this case (which probably should be -EIO as
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index ab161289d1bf..95e17504e46a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -340,6 +340,14 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>  struct drm_sched_job {
>  	struct spsc_node		queue_node;
>  	struct list_head		list;
> +
> +	/**
> +	 * @sched:
> +	 *
> +	 * The scheduler this job is or will be scheduled on. Gets set by
> +	 * drm_sched_job_arm(). Valid until drm_sched_backend_ops.free_job()
> +	 * has finished.
> +	 */
>  	struct drm_gpu_scheduler	*sched;
>  	struct drm_sched_fence		*s_fence;
>  
> -- 
> 2.47.0
> 
