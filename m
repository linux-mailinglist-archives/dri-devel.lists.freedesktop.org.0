Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A419AC0EC1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 16:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6DF10E7C6;
	Thu, 22 May 2025 14:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G78WibhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920F10E268;
 Thu, 22 May 2025 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747925469; x=1779461469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2rRHMAZB0ZruvHyT0t7zjqQM/iI6uH9NFPs7kPc52Mg=;
 b=G78WibhEpcnFQGw4trbX98jejgFg5NAokusZ4sd4bEvy6i0zVfPQeEYl
 4Vpbzny93wMWPBfyb0HOS6fqnCI2cClJgtE2clvpmp5NgtC6DIzrAIMuC
 U9PbPSpCrfOSJCiQg32KHgUfADlNN6JwXRdKw7dBkMfBKhsbfh7fbjuvu
 I3E88QlDnojjqKMccmHLtoUyvcxc0WvexR3xVpXeq9QnGXzL1Yj8xGLc6
 ob2hFkHv+twnRc7W6XKjeupwfKNJXM32JiJoFA7SPylefysGh4ME7PY/T
 y6CZX4kr9QeRxDk0X0NqOSXdjR1AOVfdi4lf11mJTybkrRtk1D8ca0iPM w==;
X-CSE-ConnectionGUID: C1PtQ5dRS5mdYIm6AblSYA==
X-CSE-MsgGUID: rDYVNAc8Qm6kdIhKBOR2AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49874807"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49874807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:51:05 -0700
X-CSE-ConnectionGUID: MFtBVrr1TE6Mz1M/foOV9w==
X-CSE-MsgGUID: nK6PylYmTzK6UWJXUJ6Y4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="171514503"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 07:51:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 07:51:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 07:51:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 07:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGn2om1hmk5jQS+YGluzxjW0skjvKz3hHDVxgFk8pJVlMpQH3L0xFhgZgGHq/s5936wdELVcLCmAbJj0tKRbcgYpEjIWa/KAkSdMOUqeLekxRIWIKJ26lGbNdCLFGTnMr8yuE92qnGRxmWtAlyMQC3QhfvRtRNRjzzfhc6T26NVC4UrcHU22NC7KHeldzYUty6kn3GIuYjnmVbfCNG6rF5ZAdPlTYMVxe3z8C+yK5XvRAx5RHWdb2U94Og4EzjfhtLH5TRHrgUodWDUCtWGXRIiyWU8pFTHK8TyvzqsqwnKg4We4ds4VXxUADgQIf8zVGzr9IAySxyXGnjoVb4lwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCqUzttvi/TCBTnqGxVT47t9a3v/qCE7ZNF9yZ0obIg=;
 b=n6BfIn0mSlTGlx+mNYD6iJbCUk8zzJRA3L0uvc3gfALxjNwvDwRQ2Cf1Af01z51pPOGokqp9Mavzh9c+3vDMAfKsCe7rC0IFl1H50/oGs/La+nq2JmGwL4OILoN823haLwHL4JmL66tjlIhSSNTtw/ceiKdTN1CwpJyILQuCjcvmueOUk9RuNddvkqNSgHH0NjsFWopLn4+hsGbFnIyQvx6/2bmLSY/VxFn6JQL+VirZnTrTy04y4BHj35STi+UJqWgwHFFad4gquFz/Iu8ZSrwedF2GXBpUo8qz84T1VpvsV65MqSx6x9n5HSHcRJoS3UnlC+eU35VDb3423fcKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 14:51:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 14:51:02 +0000
Date: Thu, 22 May 2025 09:50:59 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/bo: add GPU memory trace points
Message-ID: <vvtskvjaqcorex5xpeyyyuvljgikpdyo2vbncgmsdlutpnfaeb@u5gtlafthvh2>
References: <20250521224239.856298-1-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250521224239.856298-1-justonli@chromium.org>
X-ClientProxiedBy: BY5PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: e28c42f7-3ebb-4921-d272-08dd99401268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bsrhIqp8/f8FQDJEy+JSZaOQtYC1itsNik3ussX56HIkyTfJb9agGCV8fpJV?=
 =?us-ascii?Q?yOJk6FmCLTnN1FmvhqQ6/sc9DejNldIBwFl87PY6UZ5hqm/q7A44g44SKAL2?=
 =?us-ascii?Q?qU6aEwdlduwwX0jf6WjBjHNIrFmUx9v7JUdMNE148wJDeaivsTR0SYRO/Lb+?=
 =?us-ascii?Q?HiHTa4paqiA6B4uvZmcGYJwigWMYcf/BK8otdlKgE70n0zalGEHIYrG39ig8?=
 =?us-ascii?Q?t2U5nUdnmz2m2HL0JS6nXlOsZwS38pYx3vyV3jWM5f6cbvR9+ZImQerXXhLa?=
 =?us-ascii?Q?UsPZvqw1Ro2ZKqfAMQK9SmpWTEbtm2yqIF17T1QcqoYVeyjyfXjPfA6GMKsu?=
 =?us-ascii?Q?/RuCIznM1I2ixyC1P2h19sblQy5rk3MQ8eH6HfUuhm8Hh4Pq1Vjute3fyrVC?=
 =?us-ascii?Q?J8PD1Q/ofxn3gcRLE/BOnlwQAqr1j5hr/veJzCy++zNIpjRzFwT/jpLf7YsD?=
 =?us-ascii?Q?qT9UN6O2dyyxNKqoOFn9puW3C5SEQ/clxNJKX6dGB2R2phJNzW2tEJ/kfnCR?=
 =?us-ascii?Q?KZINVw8QphZyrdJfunE0tU9dFwz0lIMifAB863KunxR8qFX9xnCja6A+s+i2?=
 =?us-ascii?Q?XFR5iqmW0gbcbF1hyx4UK4Ssw73RdMxS3fLfAY043PQoWzJwNjcbsQc7a6HQ?=
 =?us-ascii?Q?lCtfHm0x8EBcb/VgVTK9Ipa0YkDogc+7Esi/J2zpj9QZ5vucFIkwm6RvnqDQ?=
 =?us-ascii?Q?d9ZuXRt7qlQdO49mSPADpDxKWNumUkfqcQB6yUaVUGBeo24TgGzDJC4jpKFT?=
 =?us-ascii?Q?rPKiyLEiODsmiKuq5pj0RZBAWe3U+VsVGf0Ornfz79h5LoBmsc8WDvMbCcQI?=
 =?us-ascii?Q?DBGnujCgxpIXwOs6UjQyQu8A3Vf81ZoT4MSvM/CXhGixzs8Phoq6tKd3AxAl?=
 =?us-ascii?Q?564lGy+O7ksN5qp+BOy3mcDCLGICYX4E6UdJPQQaTYitj695KfuEhPUQZKQ9?=
 =?us-ascii?Q?pQbsuNwqnXWYhbwTXbeCK7igW8wFkuN9NuPfUmK4TVzeh4vgYo3ixy+M1Ii5?=
 =?us-ascii?Q?/RnLj+QzOTTJBU3hyFdJ36cyvM4BQtjDovRMu4vOj49Xa2YBumDsRk/i/rUS?=
 =?us-ascii?Q?x2J5Bb5uMvodMByj2GXphnWQPYF64D/PCiabDG6UVC7y8XGPLrcoZraY/3uN?=
 =?us-ascii?Q?tjFuvT/lzT/hTYSvEAkhrxuk8i8n9zXCh3eZuP2O0uDD31K72r8h5WRazt0k?=
 =?us-ascii?Q?4+AYjNWGhafdR9wzIQ82Ikq9eDL2Sw4yoePZ9rdEdt8XihTKJz1lg6TVI7Rd?=
 =?us-ascii?Q?oZPjnIEDHhRZsWVdlWiL+uJFRXb0Se5JFzb5R7/uwgustdng6tfRerfHYmPn?=
 =?us-ascii?Q?da4LAJaJw6jpet8DxFEYmiwx2VQv3uVX2bg8OZrdGAfDfqkkRhHaNtIOjs+D?=
 =?us-ascii?Q?7f0yvdX2XHDslz6EDaRQd3GsLR/ww03+IGUBn3kpTHnKd8UdAsVcERHgsTul?=
 =?us-ascii?Q?T466rpeoMEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MXH/Lq2PUA2fLMitMSqI4YJB/kN33NJstW4Yz4X3EoJdYpnMN6gHbttTjKHo?=
 =?us-ascii?Q?aQ4ZfL21Y38UhmCQnmTSGjkZC0iUfdfa6KS78oVwSZMDBpbZTWbDS+PsmyMv?=
 =?us-ascii?Q?c53U11QSPxYphSQDKE0OCKH4qZTbh9yRIDXRi8bfE6vHfqdA5zxcfLuaYkm/?=
 =?us-ascii?Q?sOyNwjRPhOEA0E9wN4jtahjezU9zyfb8wfJ5/awvNB8f6PR35jYkODYA6wXI?=
 =?us-ascii?Q?JkgRpE8veU4wP4ITqFG910+zflnlq5qc3gX2caxkXSdvHdOX2C9qnonMO6fj?=
 =?us-ascii?Q?Hxc6f4nBUR4I9P/b9gABEdNW2geFSD377w35XO095uoN964WgRgL1G8Wj5Vw?=
 =?us-ascii?Q?9+xvsiPY7EhoFLRvm+inRd46McS+UjT9H056WpSw4ytbtZmxKVg8PnUyrB/4?=
 =?us-ascii?Q?k74nJmg+OEk3T45UAzIoQHKN3sVf0pvvr4S3Pbo+aZuyZbYh1BcHxtzzkD5i?=
 =?us-ascii?Q?vNBdYgUUDKhtpMSU7zCPoXXtCoM+J92LBN6n7ZoD89wYM5YV6IDRXS81EN/q?=
 =?us-ascii?Q?sXqoJleh/N6jrUB3/hS1f0FS43RxKNT5iBtYLF5/YKYhZ+IvcfrUy8HQVaPS?=
 =?us-ascii?Q?xOwaiiqnQgmSXLvxl3WWUEwPvz1qmgs6wTaHz9l8AHKzDubpXDYP6gjOL/XH?=
 =?us-ascii?Q?aGaGSmcoYB4l4JUBA9+rCNd45bz0hGlwFjfJQNRD6OAkf+j7bSpf1jCeaLJ1?=
 =?us-ascii?Q?8tzXHzxR9b/teap0QSMSM1ksiBB0z7G0kdd3pOxK6zRRbPXSq9vSNkz8GtBO?=
 =?us-ascii?Q?UVvIjSOK7C1FlfofFd5jRFofoY2wHzoAic2TgKJQg6y/DWCkwxb4V/Z+jB/I?=
 =?us-ascii?Q?ITeydlpU1o6S4DkgPOguz9ubxTc0Bm9Ofq3cyfUXy25fqUaZgU09xRgzCiOl?=
 =?us-ascii?Q?J9XbEiypPm77+tnCj6g1kkA9KhQRjIRUD7GD3ElT/PM+wWOh6vYw1SXN9J1D?=
 =?us-ascii?Q?vVcpp2EaTQDExeUf02eyXw1Eotxwyr8gagkWShOEiiNbwb45an2DpR3wQ+RC?=
 =?us-ascii?Q?lBsbB/qkxMoabetJvrVOv1pvCgoF5+J2z0WMFrk/uPJis+vVj+kGRZ0swQbn?=
 =?us-ascii?Q?R/zU1WOpNW+95gudFfi35pN6DSJsb7YadKcvuPGZEyoLzR2p8MrTHA5ROc7N?=
 =?us-ascii?Q?la9JO4SH7oKC+Lyiiqcm2OCg1ev2Jjf3HIqQGwaakillFXGimcPgrE1cTwr8?=
 =?us-ascii?Q?dl5X5fc2jaRrNMKGXFMNHRU85QEPaarQjpAeShuZaU1Bxj2AvHZDSpvZ3lIb?=
 =?us-ascii?Q?XD2x2jEepfRt6gRXvuof2XN9uvtfQamxFcWEFsAUFPkqKDD885ulLFuKa2NP?=
 =?us-ascii?Q?qPmTYbgyzfsrnnH6/SKEyGn9+M2BoeqFupvHK3jwphGN/TZI5xz+wJrBMciD?=
 =?us-ascii?Q?mNSI/mEFfZHTd+Nb3q1PPd8jqETwxdnAZuMVZoGVk0alu6hUFN5nJiUa1s8B?=
 =?us-ascii?Q?zcAObDcx++OjZZgl2T0Fx5/TzCBMP7bWOTj71MZ8dHUd9enQW8iP89b8qWW0?=
 =?us-ascii?Q?m7hm5dMETMexoK4mvOKNuBK9RJ8oW0DMaoJg9Ko43W4IRi+FKhKsRY56nNqn?=
 =?us-ascii?Q?yrebceXlzXAPMHUoMKBRejyeqeKFppTyqbALrlbBAOQzBrFMDpr3PAdqTcMV?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e28c42f7-3ebb-4921-d272-08dd99401268
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:51:02.4859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +roEy2X3gK6kUEcdAgVq583HSdpvwv5IXxW01AgPHWfCfmeLyPoOmchkcAa3o4Rr1NDl6Vq78k1FMjFn6U1T1jZFtNsz2RamktSFr//VeDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
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

+ dri-devel

On Wed, May 21, 2025 at 10:42:35PM +0000, Juston Li wrote:
>Add tracepoints behind CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS for tracking
>global and per-process GPU memory usage.
>
>These are required by VSR on Android 12+ for reporting GPU driver memory
>allocations.
>
>v2:
> - Use u64 as preferred by checkpatch (Tvrtko)
> - Fix errors in comments/Kconfig description (Tvrtko)
> - drop redundant "CONFIG_" in Kconfig
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>---
> drivers/gpu/drm/xe/Kconfig.debug     | 12 +++++++
> drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> 3 files changed, 75 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 01735c6ece8ba..2371eeda0afd5 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -111,3 +111,15 @@ config DRM_XE_USERPTR_INVAL_INJECT
>
> 	 Recommended for driver developers only.
> 	 If in doubt, say "N".
>+
>+config DRM_XE_GPU_MEM_TRACEPOINTS

is there any particular reason to make this user-configurable per driver?
Why aren't we making CONFIG_TRACE_GPU_MEM configurable (if needed, but
could just depend on CONFIG_TRACEPOINTS) and then drivers just use it.

>+	bool "Enable Xe GPU memory usage tracepoints"
>+	default n
>+	select TRACE_GPU_MEM
>+	help
>+	  Choose this option to enable tracepoints for tracking
>+	  global and per-process GPU memory usage.
>+	  Intended for performance profiling and required for
>+	  Android.
>+
>+	  If in doubt, say "N".
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index d99d91fe8aa98..49ee20d54ede6 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -19,6 +19,8 @@
>
> #include <kunit/static_stub.h>
>
>+#include <trace/events/gpu_mem.h>
>+
> #include "xe_device.h"
> #include "xe_dma_buf.h"
> #include "xe_drm_client.h"
>@@ -420,6 +422,35 @@ static void xe_ttm_tt_account_subtract(struct ttm_tt *tt)
> 		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, -(long)tt->num_pages, 0);
> }
>
>+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>+static void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
>+{
>+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>+	u64 global_total_pages =
>+		atomic64_add_return(num_pages, &xe->global_total_pages);
>+
>+	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>+}
>+
>+static void update_process_mem(struct drm_file *file, ssize_t size)
>+{
>+	struct xe_file *xef = to_xe_file(file);
>+	u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>+
>+	rcu_read_lock(); /* Locks file->pid! */
>+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), process_mem);
>+	rcu_read_unlock();
>+}
>+#else
>+static inline void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
>+{
>+}
>+
>+static inline void update_process_mem(struct drm_file *file, ssize_t size)
>+{
>+}
>+#endif
>+
> static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> 				       u32 page_flags)
> {
>@@ -528,6 +559,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>
> 	xe_tt->purgeable = false;
> 	xe_ttm_tt_account_add(tt);
>+	update_global_total_pages(ttm_dev, tt->num_pages);
>
> 	return 0;
> }
>@@ -542,6 +574,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>
> 	ttm_pool_free(&ttm_dev->pool, tt);
> 	xe_ttm_tt_account_subtract(tt);
>+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
> }
>
> static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>@@ -1648,6 +1681,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> }
>
>+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>+static int xe_gem_object_open(struct drm_gem_object *obj,
>+			      struct drm_file *file_priv)
>+{
>+	update_process_mem(file_priv, obj->size);
>+	return 0;
>+}
>+#endif
>+
> static void xe_gem_object_close(struct drm_gem_object *obj,
> 				struct drm_file *file_priv)
> {
>@@ -1660,6 +1702,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
> 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> 		xe_bo_unlock(bo);
> 	}
>+
>+	update_process_mem(file_priv, -obj->size);
> }
>
> static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>@@ -1757,6 +1801,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>
> static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> 	.free = xe_gem_object_free,
>+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)

in future we may have other reasons for this, then we will need to
refactor these ifdefs. So, maybe just assign this without ifdef, which
allows to remove the ifdef around xe_gem_object_open. The impl of the
update_* functions could also be in the form

static void update_...()
{
#if IS_ENABLED(CONFIG_...)
#endif
}

thanks
Lucas De Marchi

>+	.open = xe_gem_object_open,
>+#endif
> 	.close = xe_gem_object_close,
> 	.mmap = drm_gem_ttm_mmap,
> 	.export = xe_gem_prime_export,
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index f81be293b260e..dd9d411e66dac 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -639,6 +639,14 @@ struct xe_device {
> 		unsigned int fsb_freq, mem_freq, is_ddr3;
> 	};
> #endif
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>+	/**
>+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
>+	 * tracepoints
>+	 */
>+	atomic64_t global_total_pages;
>+#endif
> };
>
> /**
>@@ -700,6 +708,14 @@ struct xe_file {
>
> 	/** @refcount: ref count of this xe file */
> 	struct kref refcount;
>+
>+#if IS_ENABLED(CONFIG_DRM_XE_GPU_MEM_TRACEPOINTS)
>+	/**
>+	 * @process_mem: per-process GPU memory usage tracked for gpu_mem
>+	 * tracepoints
>+	 */
>+	atomic64_t process_mem;
>+#endif
> };
>
> #endif
>-- 
>2.49.0.1143.g0be31eac6b-goog
>
