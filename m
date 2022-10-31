Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353C61330A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 10:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BECB10E17D;
	Mon, 31 Oct 2022 09:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFA310E17D;
 Mon, 31 Oct 2022 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667209779; x=1698745779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MxtXez7LHRGM1RUawtz9phUPnSzyxs+1nEpHnnD32MA=;
 b=HgFGPHL5K7YsKBmLtIT8PvBKuIBoXqbVN0HxaKmC7dOICiwLP+NCdZpW
 difG1hw01QzWVxdVUU/NqvI9Lj1TTwdIEs3zVFwuKFGI+sExm9nChJUBy
 p2BFIhx0B7EoHSxYfMepzViI1dhxjcy+4jpUg6/60d5ToIfnk62pCqLTp
 KdzfCW7Tjs5cxnCdaHjPjdUztfiuBKB59F6CghudZzJw6p0JFQXTJOTHE
 zSICJjpj/DjYizg95zYdUFN2cr9HrnCJTRUrdS30eVKCqX1DtVmwkBPvN
 5flmbV9pCNf57e2rk0ew1SbPripwmLNt0hfEkNNq+iFT7BZ+d/56xBOOA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="395173389"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="395173389"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 02:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="808497121"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="808497121"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 31 Oct 2022 02:49:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 02:49:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 31 Oct 2022 02:49:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 31 Oct 2022 02:49:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C87wvSyewVbiSOc4dqXfztRF5VYW+WP2OQ5Y82gAR6iW85KvKgnHosKTolg06TB3XKw9I3mRMeZM+7MNBufxtazsaekMmGNGjBN/3zLEihMzlHsKrAcL6Tt4TZGYW/OxmPHQ8VWnzWkLxhATAINigD08BSLX5DxiFfSIHR5umzq6GwPXaHVkHrf3xfb5eQsgJR9NW0Z9Jc276X9fytqeAegTtNAvbn8qg3Fs1x9t+xsNmn4GRn39ZiDzCbDAvyT0RzB5iTg6oqOAIAt1I6zRuR+z7jEBJH0sc4ySQ3HMBHDRqW5P3mnukbFsOuqgj9TlVAQKM66c9+l7o9BEDoFLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDvxsrtTqwivkzyK5UrP6+1Pz03xxjV+glVmg63LmF4=;
 b=ZQ9GcLHPUnLOnKHBNSD3/XHy6B9G/lcYOX0ovUhaA+AKAZ/8OOB61kGSGs148e2JMqhOsEu+vjIN6EE1M2Et5BRxvH2F0rBBFi9hJJh7ylgGmXsORJzK7+XmzRbZQW2JSZYsgmla3TXmdFh0e+Oy5qZTcTSH/4g53qNvb1BAY7e0s4TERHlVUHCN2VkDEF1xvvWdh5xdAMZbNsTD8SWQJHKi7/jm4dv+VpVvoE/GoxmNzERcxd8VfqkV3L8sYSZNeeZW+qUaLpGsLgEqjdhHQaaZxwwNK4prfEY3SjoqqglW2V+yiwc5Fc3g3QWsxjgucHmwVOK/fAbKD1TxE/NGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Mon, 31 Oct
 2022 09:49:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::29e1:56c3:823b:45d%4]) with mapi id 15.20.5769.015; Mon, 31 Oct 2022
 09:49:35 +0000
Date: Mon, 31 Oct 2022 05:49:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Add MC6 Wa_14017210380 for SAMedia
Message-ID: <Y1+aKo29GfuJ/8PS@intel.com>
References: <20221028192935.1458271-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221028192935.1458271-1-badal.nilawar@intel.com>
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0eb701-6b56-4202-088a-08dabb2537d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2cd/4Fgclp/sx8e5DotfgYzBaTEx1YBvpN7sRo6AfjZy+mCZtTKkjr1mPlRV8uJt8Blb4ZPDRbonUVb3IHg+DLx0vyIeUbd8NPqNZYXbIMBvwYw0OGfkRGTyUCEOVfFSLd++/8VXHd/WttfNnrV+up/ckadCIwahea179znrPvk6/KsKDRTIYHe2p1RlroVfnJ/pURWEurH/UGGQDJkWywNSI7bV1XxQfVFbhcGn4MKoTz75sHvSXQSZSx0iGv7QnoxgtbLMIWHD9dkRYny05NKLd/8AKnaTyR93D1BsQHrcYXnuqt5wPuZNs/JajwG4kcn59sQH8A9AuoCa8Q22/m846+eA7eH+jJF0NdLBoXbfLgjGNK8Qsa8+uVd/LZPufsXZ8teYovlvvptu4xJM1KASE3bi92okS/w+fA17ZT3WEz/Yu8KHNhY4vffpIxGH+eq3leX+xVd3uvK0717nLf8jiKlmfN5rcTskKD8Yu9JTf/mWZjDDykf3gTFMqvjxCxuT8Zy1o80WNOL35dR8hWB7TjD+x/XgjF6hURIIz452hvQ8pARuV9I5ehW/ik//afKTZtMJU4p8HrC+pQx1GFEyrh3gCFhwMf/YpBVSk/kcluLRKyMP5HSKD4Dg5+LMsqa5P0lu19PC5JH5irKeVgqFsk/3hJbilmJxeUQpYY7M9LB5OU06p56z/K/3xGwQAWr+VRnndGd8tGIaqPXu4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(6512007)(6506007)(2616005)(26005)(6666004)(186003)(107886003)(83380400001)(2906002)(478600001)(44832011)(8676002)(6636002)(316002)(450100002)(8936002)(6486002)(66556008)(66946007)(66476007)(41300700001)(5660300002)(4326008)(86362001)(36756003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jH6r9kWusNSk+iXwMMkpG8l8ygT98e6VMRCw9uqPIdo5ePaq4gZbOpe1AAzr?=
 =?us-ascii?Q?RGnfyB1KZoaERpxR65spyB66yGLOHuqPSVs1pTRiCU/GI2CizvC7ZbO7JlCt?=
 =?us-ascii?Q?HHJsM36cp7S/UM/PWEP6xG3nncpmVSRB8HzpaBWrLaLZX+G+SPEINnMm3qJt?=
 =?us-ascii?Q?MQI18yZdQHpkFcW5e9owKjEzvfKhdiR8ApTjkAeeWsM/omvxeNnQ5LUwSAx1?=
 =?us-ascii?Q?t84tgTyidDnuNyFwLg8Gld3DJnA9zTCYdIpFLbUYY6z9X7JucTSGSqJLhpm0?=
 =?us-ascii?Q?SWnXFJ3PKaxDtqae6Pg51LD3RCGPvNsCJB0lWM9qBthIqOCJ8Zkkp9RGmunX?=
 =?us-ascii?Q?SE5N/BUf8akeaRyZHXcqaGPTxiLuHKJpKHL1XT0DL4/iqkhQUjxu2tijt+Pc?=
 =?us-ascii?Q?ulILRK/HCKCKJBtIACmWIGRzGupZOVoFPh5nVQaNYGvjbsjDPard6g3Y45Tn?=
 =?us-ascii?Q?kAnzgFHUpr7px0qMflXJVycfHsSK/BF34dBrVNFEx6KExodWXGjquwpEyoz/?=
 =?us-ascii?Q?V+rpUI/5m26ZbiZxek0kt7uzzOVYv5gtCTOhPE05JgRvYJqbexQgrFRrn+r6?=
 =?us-ascii?Q?TTD0ucX7jrWZTdSA/TvwnDiNinfD37oJcE6Yx/rgZcRuaxBKQ6LM0J+/Ud5N?=
 =?us-ascii?Q?KZjUE3SQVKlzpwXLb147Byb5H+vkahyhSlNQwLJgDURma7enxzJpyeqD99EN?=
 =?us-ascii?Q?C2qeVCqaQfHVPnzauwQ7JFhcPE5BYZkL9LO9yX2U3CCuLKtaWH6/QEFm5bB+?=
 =?us-ascii?Q?mluaY6RhSkgsnpicQjnrtmFy/+F2oXvszasB5cC738Oz9EDdT2vOrkqy7eaS?=
 =?us-ascii?Q?sCFmhkw47MTKZRzV+UmrEiA33vvG5tEJC0K8c0H/wE6N/3a68wyMurqGr3qS?=
 =?us-ascii?Q?9v2DIKjh4eyaPUxywibrenNuCpW6qv8jDMVof+eMfFUec6ivCazr3tKR7B+H?=
 =?us-ascii?Q?gNFxABfF2Pc/EuOfSQDzWGLFkuJligKRVPSCpXU4C6hGCpEk+IgYL9sB8Z3T?=
 =?us-ascii?Q?SbkUF3Ja5jZ9MY+HrjRqdRJ/Po5eIn+DCUmM6R2VkZUncFMLmTkhqpv2UTGy?=
 =?us-ascii?Q?Miw8ko/I9TbvWLV41Tz2VVJPbsCThVYpmBGzyQspUMHP0j/Tq5BNL3DUgJgH?=
 =?us-ascii?Q?NkHi0T3S0ujtjRpp5igxZdKyE4LqqG1iSL31Cus0Rijz4AThm81TYdO0WThS?=
 =?us-ascii?Q?f+6/hyOr5k4d7Cg6EDfIE+Ewgol0GyEYuhBFYBBDQJfWB0fqb6/73c02lmZl?=
 =?us-ascii?Q?sW8B3V8S9miCmARRnZCybEx47dzjqTHV4LYy8SeNA4ayUHlE7k093XZL9X6K?=
 =?us-ascii?Q?ju6BMe/0QYxY1VMM+EtLpJ7T30ZwvwcSiFVEfJgoj0M4T7HcDyxcOVSzigcs?=
 =?us-ascii?Q?lxydb6lJIMFZkbAvbmFt3EQ3mxOezNZhY27GuMeCwP965hflv7dJEQPIoNik?=
 =?us-ascii?Q?CA2yCSj/NSvVpZBfC2Pa/ICGeks32tJjkeY1qziSnLY5t3EYU4Qxee/zzDKw?=
 =?us-ascii?Q?9CyaYH1Uk9HorBNa7wH2M76rDXx1W8kZmrzDissDBrED8/QNbQ5cHPPM75o8?=
 =?us-ascii?Q?udnsdnNXTcVYfeCMAcTgNyB6pqWTgysJojoN5D3IEAIxSc8Ko2ZBUjOf1/EN?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0eb701-6b56-4202-088a-08dabb2537d8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 09:49:35.7555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9w3IoP3Be14EWT8UFq6yq8z47AcYvnee55JGvH2ZVbkWn2vPB8HGnIiUu0v/In1KyG1pZJyq+MIJ2LmJDanrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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
 daniele.ceraolospurio@intel.com, vinay.belgaumkar@intel.com
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
> +
> +static bool mtl_needs_media_mc6_wa(struct intel_gt *gt)

+Ashutosh since we recently discussed about the term "MC6".

in that discussion we have concluded to not introduce a new term
since it is not used in any kind of spec and might only bring
more doubts then answers, although "Render" in the media gt
makes no sense as well.

In the end, most of the code is common and is called as rc6.
so we should maybe s/mc6/media_rc6 here?

The rest of the patch looks good to me. But we need to check the IGT
failure on a pm related test that failed... just to be sure.

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
