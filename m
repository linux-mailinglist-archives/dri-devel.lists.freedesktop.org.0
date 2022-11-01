Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E8614E24
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 16:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1410E242;
	Tue,  1 Nov 2022 15:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2DB10E040;
 Tue,  1 Nov 2022 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667315868; x=1698851868;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BvKTJj149xXIbMmmHD8ZPCuF5sESndFhX2/jt1yOXjQ=;
 b=Bw7zOVGYWVseU9mLlE+TxTiKk6nBILb+negsi9qyauCVvi9f8NQrl2D9
 PCdIS0K+vvfvEw8VuYj1YTavPlM/ZAWz77zgRJbu9t+aT4dXp4wPZwN4s
 /wvTlXrXzXaZdoq4SsgQwjJYZ+XS++IOsTw+4ZwYr/dgBFMFlXSc+v7FM
 vAoqQtd3enuMhIzC2tXefB2IYqIiSlmOEwBhNXgDZpXZCOv1jIphPxuao
 RYmn/f8F7yQJ0TmvAxiK3+CYUbVDSx+BKIi2WDvw7/zueCfqCzpjTl9wo
 5PqrEKB73TzDJLHs34Ib7/qhQzV6Ir9OWOg30XczQAJhC71QI4ZfBbu2f A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="309158823"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="309158823"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 08:17:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="702904644"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; d="scan'208";a="702904644"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2022 08:17:47 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 08:17:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 08:17:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 08:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm93nSkQw2HaYUhhE8XqRUP0MyRjQQ9QPDGFAhStu/5wuQRfZ9laYGdjN+hkqbLZ+1Py3LD0I/m6mVcvqgUYfiGMjtegbNHq9LX3uOAdRKKYnaBuRDY666nSJl/mWlqjCoZ9IbXoM9PEWveUuoyzrbb/h9UQFwE+Z3CuTQKOwLbJNoxQikpkn2OpPsNuftIR3Yml9VBp4C1CqxX/EolhRR0gl0g8rGYAJBvjaxSYVVNvwAOsWRoR3cFnjHNS4GxOYStNg1vJB7op8u40A4daPNDCkF4FVW93gXhPOLmwF3Zqh4BUCBa3rNGFzrLAW4HrDR8lRfWpZe+EIVG7qD/DiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3Un+wDhkuHa4pH0N3m+lvHuiWhBMrcbLUBrCqaAAd8=;
 b=bECmK5uFAMKzKWh6Fx5Lvfb6dgqbfL+QdQYIqXMvHLEPs5J6mVodu2utOFE1Tb00/IsitmucYDDX5gGoJLgsvzPQ5136mv/dTJvFOZFjjqrH6FbkcGcqbHl5AnLNSBST7E5G6EgJOZqsNRDYkTqARw2+YySbcylF1M0pW7Nlva7WTTF5i3C/HX47cjjKI2eTGll58fwaDsdhf6IrFi3FIxIK4wULyKkOwr9eHa9UH90eFviB0VsrytD6/9su70m3LRYxxiT34bUQ2UJ+givh7+sRkRK2Ba25yjxWk9mFaCxJ2GWHngqne1/2DULEFQxrMFHih52yuHg8rGRN+4dPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 15:17:38 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::3933:ff49:d505:3fa5%5]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 15:17:38 +0000
Date: Tue, 1 Nov 2022 08:17:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Add MC6 Wa_14017210380 for SAMedia
Message-ID: <Y2E4j92zwv0Yx69t@mdroper-desk1.amr.corp.intel.com>
References: <20221028192935.1458271-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221028192935.1458271-1-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: b1aacff2-0069-49b7-f13b-08dabc1c35ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNSiO+iOgITwrQr42c8Zv9Zp1s2krMU6j5eYNpIR2i3XLmj0jIIJMRMNnDVArLsTuTTi4mvK8zJ09QmSeYgx1AiDcW+OSHH6ItVKM1s18SREqywtXF0g7pr45rtdfh12s5B3BZKnqSFB1pirzr2ZRYmKBa68JP3aLuaO7Qim+xvzlNT3rLpavaphrAUFDzIhJQSL41m49Iq/tQZO8z8oBUr3/lFYgCvqFTszO/mpLM4KcbrrXli5p8LCDJ4PEVk4a43EKsrThUpags4AB+E9iB5Wt8puiLHzMuqxgvaHahfgd05g/NqEl74Nr7luvGOlPL3z7XQN4jB3ZBbqMUvzsn8P2qJVu/dXDxY7pK6Uk2aUh4maX9lZuYQypWgziyce112ZOsmBOE4urzdJpS71NWzC3+3S2GrW3axdsjkoVHSmal+updreSc3YXawox8hqwUKatdCB7ZDW/vHMh7O9YwykVJF31vX8xbLSO7X4W+FsmpancCz4tmorOAMbHK4xicV9v1/S7s1U0eJo8mK2xC5Gww9cI6d+yY7lu3KxUzCOaIPtnDExxY9Cx67piWT7j8DiKvd3MHqvhRQYXNAMhFycwfTmAUFmMTb0GTeUExg5GheD7rZcvOUt3AFo116bSXRsShQHB5tRiZSjexBdyradR8W9fNzBAhH2tOX2NGtZw/rJD2H0FpQtMmPdKYtAQ9WcEo+4WFiX+q4AqZms3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199015)(478600001)(6486002)(6506007)(4326008)(316002)(66476007)(66946007)(66556008)(450100002)(8676002)(6636002)(107886003)(6666004)(6512007)(8936002)(38100700002)(26005)(6862004)(5660300002)(41300700001)(186003)(86362001)(83380400001)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3W+vf9wWVGREzrgUjB6OEENVPWlgdWV4uP/ZpPUlC+mzaBIQcpSlZyItjUS?=
 =?us-ascii?Q?fYgrE9wI1yCjAJ1yzqBrJBwKWqmhSV76A5GVW7p22ViRubYnMkxZeyzVsvE4?=
 =?us-ascii?Q?WHsGztkoDYa5gG/Nz06mrdZkuI5XYYikaa8Hp1R4rcGScPdU6Vy9wwb1qkwG?=
 =?us-ascii?Q?O6ehX5gb+C8iLv0I60QJmGBeNiXBiiVWmFtlng4ebQNZSQL+jx6lJ3hlKU03?=
 =?us-ascii?Q?dxy1XI/ASVvUZk8kbO8HjKd+dHaIueAmFbHiewVjxkIWaIEwIYHBUvBhTniG?=
 =?us-ascii?Q?4M1lXe7IlGNN9BAbETMB80974Jw3f43o4owMq39EUZ7kS/RIzCn42e+IBOIx?=
 =?us-ascii?Q?A5lPICymqCtyftdz8t9KCMc4ulqhLGY0TkP/V1ewQYfvrn/ulnxqttaH7u5B?=
 =?us-ascii?Q?O6eEM4sDvtd4ka1ov+7eoi6JR+pc4mfJzYwS868kkpbCUNHM6A82oBa4L8lX?=
 =?us-ascii?Q?OseUE5wTRVRagBm57R1sp6hjmxdeBqw8QnWZKNvc19tKlp9qb8h5T+h/n0fg?=
 =?us-ascii?Q?kp2wCBLqTb9jpkDOqz+8bwryhzljRqzXvjjy382Sf/oPg2HBJ/x3CzppxbRW?=
 =?us-ascii?Q?+/Ok/WCPCB0lZQtV4F2r3iZzBJagxpurXe71XgxndYMGfOkRTnbJQ2LMnEL5?=
 =?us-ascii?Q?je6C7bIzLPTowrTECiF8aF/0rzjr+uhg8aJd7vRB17oqhHC555Wbu2gmbyam?=
 =?us-ascii?Q?I22dmKrFnNLhWP6OI6V1oexVz6F4d45uelc9s977BUZRRTWP2+Ctkjef9QTk?=
 =?us-ascii?Q?6QdD9wBxoLuKUVaqzIHDVE4YEaEEAdfv6kKIIKbsUsa1UgNo3PM0U1/4nSBA?=
 =?us-ascii?Q?mkZzv3oojJPyb5ym9XatDFNYe7sHoWi1KwM6CK7iySEwsrQQOKBm1v1+q0ci?=
 =?us-ascii?Q?MrnITxXrUMtcjCdCjAg6ndXfr2rfA92/1L3zZzprZpBFaO7qbiTVNcQMT59l?=
 =?us-ascii?Q?i+DWLpYFlAPSvlnYSbCy6C/MrryB3NMOa/cq9y5xHAkF6RZjLnniRyvTMS2X?=
 =?us-ascii?Q?oXmshHZq8jXOk33agB3AKRuM7GBusCBIQaYNLCkV0eH8LoDtdVPJsHZRpdnU?=
 =?us-ascii?Q?tBfnQhN39GoW0H1d9ACqoHVoCs+7Z1HhEHZvcr16EJWnANWKTQ0hH5llL5pH?=
 =?us-ascii?Q?O94dmzGhe70Y/N68LOmCkn7caA/kdRt8l1Jn7dHlQdlUW2Mny/1ld3tXXfRN?=
 =?us-ascii?Q?PQqSSklnHFe75rINtRxKAyQrSIaXZ+hNg7VqMmj+jL25L0yGNntAhgoPyFL7?=
 =?us-ascii?Q?Wt90TzkZeIA578XF317O08yIlgvjTn9NT3Z9qL3vjnK+3SRw4I3blgGUTryX?=
 =?us-ascii?Q?A2y+NKGLYNgpOfZ5tanCcmbJ0gmk1CAYsWXve1HsgwCYdd2HxfXBDDFEX967?=
 =?us-ascii?Q?7RmBDleu228RZaQbQxiLhwf8ElVUIUr36kILPa4KGlOS4G1fGzjH2ldQcSxw?=
 =?us-ascii?Q?UfzYxLakhOeRWiV1YfQExZR8CcmDVMLLc94qEdNiQ+qnD8pKk3Ea8jJkA5AF?=
 =?us-ascii?Q?ge9fYTcIFq11F62x+zBkerqb1z13ulwl4XL6IfuhkOMI+Ud9JkAqdT/Ik1lH?=
 =?us-ascii?Q?5cmA/jqj3B9iarGOmnb8pALpuWGzPk/GaI/8017fmYbfGF0LqqKC7aepMp27?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aacff2-0069-49b7-f13b-08dabc1c35ff
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 15:17:38.2261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SD7xmxd0G0UdmYSJRn4TUmP9dBrEiChVOF7SYXK4lJj6uEX9zs3mwQIkljZEQtuD7AJByMKPRGjhEBW+9lrALB9+2KUxE4pcxH5Hn6fTOwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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
Cc: anshuman.gupta@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ashutosh.dixit@intel.com, jon.ewins@intel.com,
 daniele.ceraolospurio@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 12:59:35AM +0530, Badal Nilawar wrote:
> This workaround is added for Media Tile of MTL A step. It is to help
> pcode workaround which handles the hardware bug seen on CXL splitter
> during package C2/C3 transitins due to MC6 entry/exit. As a part of
> workaround pcode expect kmd to send mailbox message "media busy" when
> components of Media tile is in use and "media not busy" when not in use.
> As per workaround description gucrc need to be disabled so enabled
> host based RC for Media tile.
> 
> HSD: 14017210380
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 33 +++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 13 ++++++++-
>  drivers/gpu/drm/i915/i915_drv.h           |  4 +++
>  drivers/gpu/drm/i915/i915_reg.h           |  9 +++++++
>  4 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index f553e2173bda..398dbeb298ca 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -19,10 +19,37 @@
>  #include "intel_rc6.h"
>  #include "intel_rps.h"
>  #include "intel_wakeref.h"
> +#include "intel_pcode.h"
>  #include "pxp/intel_pxp_pm.h"
>  
>  #define I915_GT_SUSPEND_IDLE_TIMEOUT (HZ / 2)
>  
> +/*
> + * Wa_14017210380: mtl
> + */

This doesn't appear to be a valid workaround number; workaround numbers
are always supposed to be the "lineage" numbers from the workaround
database.  Wa_14017073508 seems to be related; is that the one you're
implementing?

> +
> +static bool mtl_needs_media_mc6_wa(struct intel_gt *gt)

Drive-by comment:  names like this aren't great since even though
there's only one "media MC6" workaround today, that may not be true in
the future.


Matt

> +{
> +	return (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +		gt->type == GT_MEDIA);
> +}
> +
> +static void mtl_mc6_wa_media_busy(struct intel_gt *gt)
> +{
> +	if (mtl_needs_media_mc6_wa(gt))
> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> +				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
> +}
> +
> +static void mtl_mc6_wa_media_not_busy(struct intel_gt *gt)
> +{
> +	if (mtl_needs_media_mc6_wa(gt))
> +		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
> +				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
> +				  PCODE_MBOX_GT_STATE_DOMAIN_MEDIA, 0);
> +}
> +
>  static void user_forcewake(struct intel_gt *gt, bool suspend)
>  {
>  	int count = atomic_read(&gt->user_wakeref);
> @@ -70,6 +97,9 @@ static int __gt_unpark(struct intel_wakeref *wf)
>  
>  	GT_TRACE(gt, "\n");
>  
> +	/* Wa_14017210380: mtl */
> +	mtl_mc6_wa_media_busy(gt);
> +
>  	/*
>  	 * It seems that the DMC likes to transition between the DC states a lot
>  	 * when there are no connected displays (no active power domains) during
> @@ -119,6 +149,9 @@ static int __gt_park(struct intel_wakeref *wf)
>  	GEM_BUG_ON(!wakeref);
>  	intel_display_power_put_async(i915, POWER_DOMAIN_GT_IRQ, wakeref);
>  
> +	/* Wa_14017210380: mtl */
> +	mtl_mc6_wa_media_not_busy(gt);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index 8f8dd05835c5..cc6356ff84a5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -11,9 +11,20 @@
>  
>  static bool __guc_rc_supported(struct intel_guc *guc)
>  {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	/*
> +	 * Wa_14017210380: mtl
> +	 * Do not enable gucrc to avoid additional interrupts which
> +	 * may disrupt pcode wa.
> +	 */
> +	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
> +	    gt->type == GT_MEDIA)
> +		return false;
> +
>  	/* GuC RC is unavailable for pre-Gen12 */
>  	return guc->submission_supported &&
> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
> +		GRAPHICS_VER(gt->i915) >= 12;
>  }
>  
>  static bool __guc_rc_selected(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 05b3300cc4ed..659b92382ff2 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -740,6 +740,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_XEHPSDV_GRAPHICS_STEP(__i915, since, until) \
>  	(IS_XEHPSDV(__i915) && IS_GRAPHICS_STEP(__i915, since, until))
>  
> +#define IS_MTL_GRAPHICS_STEP(__i915, variant, since, until) \
> +	(IS_SUBPLATFORM(__i915, INTEL_METEORLAKE, INTEL_SUBPLATFORM_##variant) && \
> +	 IS_GRAPHICS_STEP(__i915, since, until))
> +
>  /*
>   * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
>   * create three variants (G10, G11, and G12) which each have distinct
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 1c0da50c0dc7..abe62cea083d 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -6678,6 +6678,15 @@
>  /*   XEHP_PCODE_FREQUENCY_CONFIG param2 */
>  #define     PCODE_MBOX_DOMAIN_NONE		0x0
>  #define     PCODE_MBOX_DOMAIN_MEDIAFF		0x3
> +
> +/* Wa_14017210380: mtl */
> +#define   PCODE_MBOX_GT_STATE			0x50
> +/* sub-commands (param1) */
> +#define     PCODE_MBOX_GT_STATE_MEDIA_BUSY	0x1
> +#define     PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY	0x2
> +/* param2 */
> +#define     PCODE_MBOX_GT_STATE_DOMAIN_MEDIA	0x1
> +
>  #define GEN6_PCODE_DATA				_MMIO(0x138128)
>  #define   GEN6_PCODE_FREQ_IA_RATIO_SHIFT	8
>  #define   GEN6_PCODE_FREQ_RING_RATIO_SHIFT	16
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
