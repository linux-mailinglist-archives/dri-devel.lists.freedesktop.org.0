Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257148AD627
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0D10F846;
	Mon, 22 Apr 2024 20:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqzlWpJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0F610F845;
 Mon, 22 Apr 2024 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713819298; x=1745355298;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KvX/IWVUIHMRyniFlfcxe5rmBaQ1V6wRXT/p2xb7Gh0=;
 b=FqzlWpJPEY033HZLSDyhT0uQmMYKJJRTJB2KpS+Akp+j5234KJ5x4tdZ
 t9lmwc9vhrpSoBiCu8YYQD5hWBEhVnUFHJ6vNgChqQO0vwCv40Ia3qNPs
 C3FM0oAXTWOuy923XBz5Z/wAdWANvElNW7MNiZtVf67xHSCEthOWbqtEm
 yiprIemRkPrOVCydV1ltSQE3C6Cxcb0QHmWfHnqz4xKb7L0NdaFdxhTlR
 kuggmT9McaYsyJJbEosmcm//B3gG8VYM8eMbyUl3aLn2YWT+lH49Lpqwc
 rrxu4a7x8iF+9YpuJs1Fat6rYbkkHNGPww8a/SrJT4g/4oPY+PA3hIwXm A==;
X-CSE-ConnectionGUID: 90IDJ4CPRf6Ye5NcGy9PHQ==
X-CSE-MsgGUID: pGeKkBYnT8KieXLYwqOkGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31869381"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="31869381"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 13:54:57 -0700
X-CSE-ConnectionGUID: Nhncx0skSQeS8ufeD3gCug==
X-CSE-MsgGUID: /gooRfGgStq/QmsfUgvdqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="28932614"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 13:54:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 13:54:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 13:54:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 13:54:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHsyE4zDIvIouehff6AHStf6c25MP7tZZ6LG7olIUbab6dDOj0l5PhgQTg9j9gaBmNIMIGylktfW9GfG9TXJaBhMUrajrjmConWsVS6nH5IDrbAEXIHvpc3148+IVma5cZCAqzFvPUNE43Gv0wCYPeHjfIPVi0FAJyxcPsVrAOOba5p1+RilpqUscKS2o7oLtoKBPNIAefOZHxup0DQwlN0jeVjQDFE/7xoLbCJ2XBoOwQjkK8GM56MoSCkRSmGCaxjDPd3RfwWvhnzLHicYYPZZ3dDKrMJ6ysvTOLmenW4yQb4Q30OzCXIXIlHrlH+dz80A1OhWYAOp5BnhgpQeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g79/r2LW0iVmPll4ZQ9BcZn7JmCyuSBam83cKJaZS3k=;
 b=HrYhNmvp33DrQ8vAMbJ1jT+fViFslxO6cBLHdIvhWx1rU/JJToumF8hy2cq1lj5WIwimXLfXRykI8B3uz1K06mDFdN1OSDYl1KhbDNLNkiYRieq6G8Fww8OaOJq04+k8qE3nRVkdZQqHxi/5LXum8g3DJK5uTV4LA3vg1AjRb61j++HgNmjAU0sbL9yeE2qyF7FNDc4TGfqKm46fWBqeJQ4zU32lDrO4CdZM+ct6ozE7QOw7R1TxbR0UaMSVZK1HfUI/Pbvo8daNfWyLnnwRajlwflw1O5gxEC3IB2g91+cmZHcNAFRKxO/cqQQeAFAVfZmrx6QBtY2NbI833bjNgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 20:54:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 20:54:54 +0000
Date: Mon, 22 Apr 2024 16:54:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <airlied@gmail.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <ZibOmWPr3pZXdoNM@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b839e50-bc4e-41c9-bd05-08dc630e7621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y2HecsErntTAx6aPs5Qex39ERaprCaPC567TTyaG4G1mOJgutZcv4++6cdRK?=
 =?us-ascii?Q?RaqXSBL6pdAXjSSAtmZHVwDmFXJtEt8L6nn/DeiXWAGU9MK1XBEo1x7hCDYr?=
 =?us-ascii?Q?ZODexNHZI+6bJShfffoxJd8Obh4OknzpriqKspqBg6dEoTOS2ATI3FwWqjjk?=
 =?us-ascii?Q?hmbSiKRL9hcebvXSsUsWkyOaP5Mtd3a3FDbcMFxQJw2p3MbpasT4OMqS7+mv?=
 =?us-ascii?Q?td3IpVfWSZ5G+AlWhphg6FwVAhoY2C7inLn0faz6CkcYm6KgZTO4RV9B6XQL?=
 =?us-ascii?Q?h/Bsm3mVRZ/D56ZwmiXMVWp+XQG6ydndc6OeY+Dpmk/ke9buvkY8sZ/QiB+K?=
 =?us-ascii?Q?HE0fz4Tvx6ZXJOGeZNmnPVnnD9ZnLFZMHs93qXcDahY04LyGmMRiKKE9lrLk?=
 =?us-ascii?Q?KXeuuilpwJaA0PFzyRwjc3Ohn8e8N2ffywoO47VIAVEOfOYuR2UHWdMH9bMn?=
 =?us-ascii?Q?H/yxi+/VgiYCkVRZvsv5h5gAoFl0ITXD6YyT2PhGK5REJvqNzh3gG4vLcNGi?=
 =?us-ascii?Q?wVYzaCXFsf7K4BojqspZaYmZ0XTwsBeShHxpbVE6kCUpdal3qRp3PcF8kPaP?=
 =?us-ascii?Q?sIxBTSwa8gYaTi3bkYCOba3e1/+p1WITIUzSJUKQoAv9AZF/iz/WhxURc4Ae?=
 =?us-ascii?Q?tY7PbKLhRx29BduFUjCai9qAz8gWU4NuFKoJFADcuw2UkLk3P/0FvG9k/LFq?=
 =?us-ascii?Q?pi/CK536YmMJLSpMz+PCR5iBabS3GnmAyo2JyI2j0oeSZoU8xzIfE6cDfxBK?=
 =?us-ascii?Q?YVGOLuFSQaSpM+AF762+4fvO5snTykaHGLKeBwHfT9t7aISVJ4hC/LIqxpLz?=
 =?us-ascii?Q?urb/DKEqH81Hd+IdWmBnyUTZiV6xzFWebpoHohqS/rjhlfWagsKLac2R8R2A?=
 =?us-ascii?Q?aNoS8a+FIp39yIykT+BsqvqY8sC3eKeUl6X1hGKOINjB4/cpEJ1rL4tOgYDA?=
 =?us-ascii?Q?TMV16tJjtLlrrzeukhJktbo2xLn+5eSPzEbfSBWLsTGOzkYt5DCHsY0kVbxg?=
 =?us-ascii?Q?TsEx4CXWc5s+riK5PbnKwF7GVsoawRsC/Jfon9RceI5v8XovzZNSY8QnfMRL?=
 =?us-ascii?Q?/5bIf+b27OoURL2Avt9++1qHUlhYm8lapzIJ4QOsINndHOTUcr+oO7O4L9Ee?=
 =?us-ascii?Q?NlHsmvJg2yWGSuheT0zOUYKcubevXw/zYT8fhh9V3d2G1EyBek7jArQvmzOW?=
 =?us-ascii?Q?hjug+wVBdk1u9YUPg8uoYRqQPVuvdfgiAX/X/Pvl2/+v0OwRndBXIziGjRfX?=
 =?us-ascii?Q?jEqX9KpIiHfVS+iyZZm+/KjzoH093jYRPmEBu4BBKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nRBu6kNMIiRLcZoW5VHz6alVON9USxlCx7at54gNv2XdsoteG0MFsBPPP1wp?=
 =?us-ascii?Q?fo+PEKbBfiH2+lzRYgK+KghMs+1Jjw4+knI8hZLeCEGDPPeduV7l1cyXwyyv?=
 =?us-ascii?Q?m6D1bBl5UrkMo5tgByfebgKJtJ8pVLclQD/2ZmsgqDkNjtVbkbkeTgSgiPDm?=
 =?us-ascii?Q?pIXDn/Iy8yzN5Tl5JH55WuH5Pwrthf7FpTgQUUfTBRdxvWN1ITxsPskkpCa+?=
 =?us-ascii?Q?hirhCHLYVzprnLkTgTdMLPvvgqJjy7cwHC+SqRQ/DEgsZazDactOndqLxFjX?=
 =?us-ascii?Q?Cbln7Qm4fAeqB+wbhFvdzWCPvwKjkCWRU85Y9GbVj5w54yzI0SfolfV0VRrd?=
 =?us-ascii?Q?MvM/l7mHsK4Wx91cSkWteuKlaI3gt21b7CU0BE9DvrkdusNsgwWoEfj4tvJf?=
 =?us-ascii?Q?dtXjO2M1USa5RTSoXSkdCxPkGT9A+xbDU66wljLSdH4AcuAUwhN6e5mkWgOH?=
 =?us-ascii?Q?Z/+wHfgSgv6k8Gl9+q0HSfh6ViERlih1zI56HSIokx4eBARZ1U+427MZXSNJ?=
 =?us-ascii?Q?3qlS5stx69j8pITw5+Cx6dQHdjlG06IPn40nIkSZZ9RnN31aCVuxRCLRdR2a?=
 =?us-ascii?Q?0zUb9iPsDIm+ZS6UcyzpskxCVjgUGOeE+xoQVN79aUOMno4jwXo9/McuUZuz?=
 =?us-ascii?Q?hxUkSR6/4whKIE6R7dqf1bsda+hSbg2UxX16OpkK5LhtiRz5TuKfo+aVMcky?=
 =?us-ascii?Q?17jLzO4t6+rKJjZkkI+jO7buV0f87xavssb+mGMmLCkPHizEouv4Gcoi4V27?=
 =?us-ascii?Q?n2l5KnHfb2kazTEOSXn2wzSg5CmknzKiXaw50FjaBtb6/I7sF8WPYcJR080n?=
 =?us-ascii?Q?ny++q3OXs+c51uv+Q4VnatRDNZZ60D1h4o09RcTCEY7aaqCYKs52K3LqEPO6?=
 =?us-ascii?Q?afHgxfbIqNtUYoeDhzUw8xkesx3q8SG9uptf+VbpptwmptJuS/ULAVQBrjkq?=
 =?us-ascii?Q?IWCLuCo1EgJ3WpV9VLdLq+25c1pHcLh572lFZELarxyxRT6zzZkvPD5LvcAF?=
 =?us-ascii?Q?sAmK1DbrKt5/WEGhF3pZyTqfb9Ayy6HWExGOgBdhL+NYmw7QuuaiDVymQssB?=
 =?us-ascii?Q?6DVRlV1RexHLFbHha8K6ij3TTMnPRcE9yWwoqUkwpL5M+2ltzevwUHRyfAL3?=
 =?us-ascii?Q?FR+QwbLlyjDzdzTYK/lU+XiqEGCzS4+N8xm4h1/4gOPYt4Vg3+rNH7gmMlDd?=
 =?us-ascii?Q?4JGjOKRDv92ZbwJwjIeyB5BRgIdxV+CBKb6I5lG38VsNJalVwq7EZ3SWNXUN?=
 =?us-ascii?Q?nTs+42h/AVFXg7rsOcaauT1mb5T4PZOymZT1ERb95xtEOnKmskiIYT2Pl8o8?=
 =?us-ascii?Q?r7nBlGt5tyBi35bCFwzWKkOT+p/Ht178YyJoR1arvW87lBbA0P+klrSub2H9?=
 =?us-ascii?Q?P5EdChN0brX3kry9mlwHn/UgWo+b+O0anpzie6vShyo4zs+LwVohuHN8RwHB?=
 =?us-ascii?Q?LmaLidfwQaEaccgw+EAC/pqNnkXmnfree+CzQdgQ/x19W4gOD9cv30lEsP1E?=
 =?us-ascii?Q?M/lDxj++a7E3objt97rSXRyxP7ffZ71jJGMATLmRxfMrrvOuQh5tXqZRo4Zq?=
 =?us-ascii?Q?UkFfC2IhWvjTTqMZyQZv/8lbWoBDlPkBsV0NA8YdsllyYtFaHXijN4KvAnTM?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b839e50-bc4e-41c9-bd05-08dc630e7621
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 20:54:54.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MgxDGOAWoIrrvmzkm8pD847oxPP6k0tIVDQdtpX+u28Jj9NwTqoD0PaCcSYCvZAxoBQoZ9aCDDDp7feQYnmRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
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

On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> In scenarios where drm_dev_put is directly called by driver we want to
> release devm_drm_dev_init_release action associated with struct
> drm_device.
> 
> v2: Directly expose the original function, instead of introducing a
> helper (Rodrigo)
> 
> v3: add kernel-doc (Maxime Ripard)
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 

please avoid these empty lines here.... cc, rv-b, sign-offs, links,
etc are all in the same block.

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
>  include/drm/drm_drv.h     |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..9d0409165f1e 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
>  					devm_drm_dev_init_release, dev);
>  }
>  
> +/**
> + * devm_drm_dev_release_action - Call the final release action of the device

Seeing the doc here gave me a second thought....

the original release should be renamed to _devm_drm_dev_release
and this should be called devm_drm_dev_release without the 'action' word.

> + * @dev: DRM device
> + *
> + * In scenarios where drm_dev_put is directly called by driver we want to release
> + * devm_drm_dev_init_release action associated with struct drm_device.

But also, this made me more confusing on why this is needed.
Why can't we call put and get back?

The next needs to make it clear on why we need to release in these
scenarios regarless of the number of counters. But do we really
want this?

Can we block the flr if we have users? Perhaps this is the reason
that on my side the flr was not that clean? beucase I had display
so I had clients connected?

> + */
> +void devm_drm_dev_release_action(struct drm_device *dev)
> +{
> +	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
> +}
> +EXPORT_SYMBOL(devm_drm_dev_release_action);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..fa9123684874 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -444,6 +444,8 @@ struct drm_driver {
>  	const struct file_operations *fops;
>  };
>  
> +void devm_drm_dev_release_action(struct drm_device *dev);
> +
>  void *__devm_drm_dev_alloc(struct device *parent,
>  			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
> -- 
> 2.25.1
> 
