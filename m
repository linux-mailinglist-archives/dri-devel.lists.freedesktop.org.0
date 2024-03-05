Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3D8723D2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76BA112BCD;
	Tue,  5 Mar 2024 16:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NXoJf51U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4687112BCD;
 Tue,  5 Mar 2024 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655079; x=1741191079;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LDx2B5dK71U1P4uKUA7uaTTKJF0oUtjpk75mVOYQzxg=;
 b=NXoJf51USPE0UVW8l2wUhm39zkhDf9HEGG3sdE5BdbiuVUfe46FdYCsN
 00wkKA4cK3QLi+QnGK8VxiuM2+LzgnyQ+Ltvw7QvjBEe0gGuKF0aAMh/K
 b9+qJSzlw6t20IdgYm8MUDbWf3quvtyuUtjSwQKRMdYQRHm2QEFJ5QVLs
 syJXk/wZgyXfQnQA9vg18DQBe096KaGRL48B7NVKHV0HmLDY6h+1ZBZwR
 ok7OsjI6BGuzk5Kj+YH1Tqv7Yk9z9bev6fIFAnYRCtLv8A9paMkHW/ahH
 CRvhUEe+r8pWjpjeVsx49/lKSSWagVgX22jPgrI9H62ECWarqEe7vkZ1b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="8037369"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="8037369"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14090387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2024 08:07:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 08:07:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 08:07:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 08:07:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 08:07:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgDOXX49ARFtMsIJa60l8MJcbEqFZautce57mtegLq9QJUwwdjaQAekSRPM67tvQUyaxO6pfS92UsB7pj31MG8gAWgAU/bYo/15r9Zp0sBCmJPIc/oBrh5mnM9bfIflpSYLDT3o+uNcnfrgFdfNu+26ncMWXN4uKwZWKp2DnfEAxvWEwHyfdWZQVDLFz4Cd3vmPAJBR3StOi7xDAsGYgxLyGzhorzpDcQSgIV3bQjaJmTwiZVauaS/SG46Irgr/6bqne6RG+XvrFNWGj+MyXm2SrKAYyKJN98BIHVj8Oc4aA2oynYevpX8jn6oH/DNdYwuenQAj4RPFHIZHcES91pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSgyuSNeWjt36aqzoWFvVgFN4P4PT1n7P/VBKGQbIoc=;
 b=KIaeidF25++Su83NtSekkuQuhZU5vd3y29Ns6HFEprbyxXoTyQ+W3AZYvYdjQVTUYJviMzd9lKk5P5aEwUPDPAgPpKsCyX/Wu20AeZHScnDVn0/9pzMsrC8UpJJNd/E4N33vQpCER+Q6GEO6Pm7G1c9Y8CD/gRgBFv04i7sQsTskT/miBTCvq1HrJNht8ONimhU4ZB1kXpSIUCvd3iQ/9X5Dx1pw9f3Aie/UH4iydpYO+la3xEaoLsV683UM2J5WtyxU1f0wsrWRfkRxQ5kJYNr12lP6o1HV9I6VkHjz1t5CNU6k6ob7P3PsOSzBUO5bZSZTLZ6T1wh38/gk5SXVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB7347.namprd11.prod.outlook.com (2603:10b6:610:14f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 16:06:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 16:06:58 +0000
Date: Tue, 5 Mar 2024 11:06:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <imre.deak@intel.com>, <tejas.upadhyay@intel.com>,
 <jouni.hogander@intel.com>, <javierm@redhat.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <lucas.demarchi@intel.com>, <ogabbay@kernel.org>,
 <thomas.hellstrom@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/6] drm/i915: Unregister in-kernel clients
Message-ID: <ZedDHPupthhNWte8@intel.com>
References: <20240301134448.31289-1-tzimmermann@suse.de>
 <20240301134448.31289-3-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240301134448.31289-3-tzimmermann@suse.de>
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH3PR11MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: c2854c09-c238-4bd1-907c-08dc3d2e48ce
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fMsEIjfwKHjC5cgq4WZb9fetO8YoyJZ+wpCWHxj0SDEgBuG39ziN2GVfIAl6jMBcVFJdxXWAawPlC3pLvIb67QDX+HBMDYwZXGOcKMP0W7ClsnBQNDZUzxyXp1igWRvuJn0kYBJeX3KpJLd+HlVwy3RxJaXW6yrT/abUGdHmRhzX3c0Oc7MFRVRt10QvJTEV5QwyqBg0ukpXv8x2tQVw7VFvOLx8xug0qud0zbWvAmRCtNGSTH4asiQ570JIUAsk4N7aJ2HnNs8X/5GHZDvJirDijNoW1BPyl6fXyBE/x3zeAjXieLtjOeUUmw9T5pJV1jNzn66KsIAEzuh6IsUKZsD2OQ5Om6dUL6Km+95KDGWxmGTtC8ACYuOQRziWEG88P4NAwEYv8ARZoTPZp3CjH2FBh6PsXtsFz/CVYlJD+m+5smhMEBWZSCPGqtSoLDbTHEtD2VIMGAXdCD9IxHCSL+WUVSLGc+WM28Ys6mUrEW9nDiCTmpKt0dbIp+uxusb9vTrBXr60n78MsRR/orWGfguTsRa0igljMkupaNtS3pmWW05wptFcq0ZwqroF/a4IYeAio4f7k7rj4tJ3/l1G4riSPAN8jGz6g2jC766wQdMPVdfeIylyn/f7+THUToQEzuEHkmz+PeM9+62nAL2wU/izFUA9khSgY4qwNL0A5LA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfKkGIGgqn5dDwKQ5TQb+LMFcOpdMwPBNAyQ0W8t07325TkkTvCp3jYGY4D+?=
 =?us-ascii?Q?Kd74FgJbpX+Wl5SOfp3W/kLUjaZmrHIx6S6bFMDZu/Fsglph+mVrqqj01I6r?=
 =?us-ascii?Q?OeG+pFkMhiIVg/c5xc9pJ4mUN2Ht5RjH1SEikIUjWnSZxgO0xg9WIzCml7pZ?=
 =?us-ascii?Q?lWgpw4EHKyKllp84tftVRXuLjq2cBxuJzv61JTMQVOuiXi7ZalfCMi43134L?=
 =?us-ascii?Q?i0sWLdyrBnApm2fHlKTIZ0MsB8kkpQLu1o583Fv/T9JvDOrPhwRuz7yR8C0T?=
 =?us-ascii?Q?DK+HmeiVgzVuQ/uv3NhlGBdQ5ud8xQxq+1vu8+NuGE6nL53H7dKCSFQ+TbwS?=
 =?us-ascii?Q?KZxx5t2JMwxQt7svPVAwpP2r8zDhPxRUEQ1zxUJe5HM9mM9vtjpJ/7TcLlDz?=
 =?us-ascii?Q?YNPj1VVVbF7VqBaSucbZYNM34nlrY8Xvnv5++APOHRLbaRR2eQ6Q/w8GNSI1?=
 =?us-ascii?Q?hUlRBuBSPql7Wixu0XRpJlU6NGGWTcScvXO9uTAX5DvuHjOxsudjJIo4nbIn?=
 =?us-ascii?Q?S7iCtyC22Kzuc8Q+TgH0jKYYG7ofVvESgkNMMXc8UdEQXn/uBs6YiYKkywyC?=
 =?us-ascii?Q?5ptlOsQR+pCBVJbQwhR5IsAH1RynDmuES/eqS8gMv+pvay1R1U1Y1VnLHKZW?=
 =?us-ascii?Q?/+qsM5rZAfCXxURNihDyjQrP9bMCBMjjdscI0GZpzm/35fG2KP98aNlRdn0Q?=
 =?us-ascii?Q?v7xFUmkgoBUoVzkEcGU1aoioP5GQFuCUJtcol21rHIKGoKfAuR3WOd9ul0gu?=
 =?us-ascii?Q?JttX/lcG6QCPZet+LftjL4my698ZRmRHbd3EQQt6Fc0IHuJf1t6H5f+mM0yu?=
 =?us-ascii?Q?1iHDAy5RGzpc3JwoGoN7QLSUnLJej5E5iqPO2lpKa9eUT6sgOce/om7iPIkc?=
 =?us-ascii?Q?cZd+opeBw9wpmzhLAxCWJqo36S2NAYB9hjEtmnw/d/5uc9Br+5CurFs6aFRM?=
 =?us-ascii?Q?ITMZCRKGJhpwnkMnlZmzGeb2/dRaDROo4FapP4lzIGaXuhd+PcVXcf9MW9uV?=
 =?us-ascii?Q?HKXDIit5OenJOZBMiL1i5V0ILs+gfDJVrTnxXvVnIK/ack7m1Qf8Ml1g7b/y?=
 =?us-ascii?Q?ebhoeIucwrWtr/ABAyZwOCJjb9tsvBGRxKaf62VDe7h2G/ul+dLKPBbYyuSh?=
 =?us-ascii?Q?mkk+kQj6aiIqFAmfL6Mius05ecZTvbO4tMHkdCc4/t0+goSFsbS1RXDq2yZv?=
 =?us-ascii?Q?h5M2F8hGM/APoK1uaNPsIb507MHWCKqSB0dq84B3u3a8TXAKo5akODIzdyQd?=
 =?us-ascii?Q?BAhN5MnmwJ+2StDdHZtZ01+GPp210V5mwwH/j5PrlEvJLHn418tokLtOQt4F?=
 =?us-ascii?Q?ponRPMjuzyD1Vtkz9vzaQ9SsPfY5C04cmV7HRfXcFCcSLllsqPJZ6jwpFRi8?=
 =?us-ascii?Q?FdKayk7K0cnI1NP/lUNq1KHPP6NikumbhTKZRq0gx3LJqqlv/mE4b+321kcy?=
 =?us-ascii?Q?v+S3pD1GRVy3Lv/0ZfK3RDxBUXyuW9oYaoF7rW8IvNUPjxdMv9CHs/C6nsfB?=
 =?us-ascii?Q?rEbZ4Vag+CA+xqb7i4Bpw8A2coUbKkA0Hp175/yLILgfCHuo0vFZb8LJysGb?=
 =?us-ascii?Q?KQajLU8joM8hYCGw3RBiGNNO0KOD39rYTiFE/MNl9eK2KD2kBrIDr2ChUCk/?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2854c09-c238-4bd1-907c-08dc3d2e48ce
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 16:06:58.2465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlzsb26/vhyEBfx9+e16ld2brrrKNimhNctoVkn6Wz1kVeUL3AMCMbgbku3rUOQzHE5C7sSBkJ6498bfQt/34g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7347
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

On Fri, Mar 01, 2024 at 02:42:55PM +0100, Thomas Zimmermann wrote:
> Unregister all in-kernel clients before unloading the i915 driver. For
> other drivers, drm_dev_unregister() does this automatically. As i915
> does not use this helper, it has to perform the call by itself. For xe,
> do the same in xe_device_remove()
> 
> Note that there are currently no in-kernel clients in i915 or xe. The
> patch prepares the drivers for a related update of their fbdev support.
> 
> v7:
> 	* update xe driver
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 3 +++
>  drivers/gpu/drm/xe/xe_device.c     | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 9ee902d5b72c4..97910a85e3917 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -41,6 +41,7 @@
>  
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
> @@ -852,6 +853,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
>  {
>  	intel_wakeref_t wakeref;
>  
> +	drm_client_dev_unregister(&i915->drm);
> +
>  	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>  
>  	i915_driver_unregister(i915);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 919ad88f0495a..7f41f0ec819f0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c

probably deserves a separate patch since this is one here is named 'drm/i915:'

> @@ -9,6 +9,7 @@
>  
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client.h>
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
> @@ -614,6 +615,8 @@ void xe_device_remove(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> +	drm_client_dev_unregister(&xe->drm);
> +
>  	xe_device_remove_display(xe);
>  
>  	xe_display_fini(xe);
> -- 
> 2.43.2
> 
