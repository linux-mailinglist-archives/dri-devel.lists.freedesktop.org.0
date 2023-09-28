Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8A7B2301
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 18:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A0F88284;
	Thu, 28 Sep 2023 16:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A76788284;
 Thu, 28 Sep 2023 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695920066; x=1727456066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WAd72MNej07L9z5KJkYkkoYz9SJ0m6Du+255c3P86rs=;
 b=XGo7aY/0L7uVZD5DmUs+++Z7iiSrFlUizGTH/15aeyiK96NOnLD2E7Qz
 H+SOYWtq1X61f8MOVfDgVV17ZXQIDReGaCk7+dLColuMlar2VtocBxSrU
 Q8Idf4MF1H/LxuWsUTTLu6h0x/qyUND8+wsfv8XNz72NHWFqzj3CZS+eH
 aKux6/Opwmxl9XMnpkAGKw6xU2AfVZwxYJHsNkItI5LTgmGJFbLhoQwx0
 cAYOW2VMTYlUmTdRz+ZsAIl+2Osxs2AFB1QOeEYWWKhEVX1WaQS+Mr5o7
 hDw3nKfK11cMz6/e+jwuAoQgnieRtzly3GDPVKMGuZMuYtbl0OzSgrW7k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468399255"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="468399255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 09:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="839956082"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="839956082"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 09:54:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 09:54:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 09:54:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 09:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8nFATQ25QsI+TpToHrvGw/9ih8YMs8lCxConZCE4spaKEmPWxJPe0o5fZ4oJZ9M959bR1TwWXQiH5XwG14jRlCG8wLy/IwBzH/15KbRULI/Q4G/r1ARdnHlTdbmket2Gl3ePc/cJhgbNEE06HfJAVdKkZcDYl84p1nYWnvad45dFq7kgAneR7QT4b1dyMSxzZbBcx/o48czZpaqVOLSoVEYeqqG0h6Cvh1nLgIAkKtSR4c+WOmZI2wVD8vecrRq0XYy2mZePyL2jPbqK/0+uh8xN7U6w+2UO8GbBuDKQRNoLeRUamEZd2Nr34aPE/+HcHWhZ8P49k+PVgF0ySLCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CaIztj+m092WwLcfqwLZZt7+ZZ+zObuJrblWgwJikk=;
 b=NkfWYVkO1OJzFRYdtLf9cI88VnC9UufVUZmKELIgrrEvL30lazkP8nu+xla7a85g85Gl9WnGg4o4z1zVRVJoM8OgF/1q16oNKQUGF77b8jjevVRi7rYOV38DLuRXlzQ6VR22DYfJfl/pFWrkYXd82wqSvqCV7OmStSdIlEqCYkB4kiu75qjjZ9MQjDJBmVY6nm0j1SK7Y0v9hug2QMww7hZvZxaY9KFbcSQL6uLTgyHsAIR5BJHfeqATG854W5gq5v4icIwBzKmRrWNtdYQiDnnHGFkOT3/rltE//JH+QmSGIgMdevPRpb5o6vnrxUg8q+dEQkpJQ8JUpvPy0uf06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 28 Sep 2023 16:54:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::14ea:3a78:f950:d6d0%7]) with mapi id 15.20.6838.024; Thu, 28 Sep 2023
 16:54:18 +0000
Date: Thu, 28 Sep 2023 09:54:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v7 1/4] drm/i915: Introduce intel_gt_mcr_lock_sanitize()
Message-ID: <20230928165414.GI2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: b70c9fd9-01dc-4984-1a93-08dbc0438d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXCUGx+oAIxjYI0E+O+ibrgukRzOp0XM1XbpJrRwkTPk5ryqBQ7W2EAojtoQFFK8WMj8PNk+oBp+ZwIy6+4Uy5W7u7LYK0JJqdheWaLE9RohDC24UvMI5xhorKY6nBig6vb0Q0eVrANoSLpPGw1lD7b2d17BAS982caye5TCjzcztzGf+6M75qfHox0CdIJsX0huheatMcw1Wytw9cxYADT5HJKR4aOoCd43X7dwU1btNwf/kHYNlAo15FcaEMK0ElHoEnSubo8guKrWTKJY5ZP9pnwqUDoQhH+zIGp6jLn+gbCje7+amZZ51vhfPuUnaBn1iAVqqbGM80OS7OoY/OZL9v91W408RM6XDOBheVGdT60TZQTEe0MJnZKgA7/Qu1SzSc8DB+iTVmwsTReNBnE6lKhVGOWXAtbbiCnIVZsv5TI/TarWAAGf+5ExitefEmqG5bdYGFzQ+7iGlTO4pE+i9aB1vbI8cn+grsRRloS6Hdk0munJSfL2exD8m/2FR+2Q05q48iwtFwfqVmFEQlt5iScCWdXVCYn0tJ1AI/lCKOzD8Qfy+iWBZTLZDf5m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(82960400001)(6486002)(6506007)(26005)(8676002)(6862004)(5660300002)(4326008)(8936002)(86362001)(38100700002)(33656002)(2906002)(6636002)(316002)(66556008)(41300700001)(66476007)(66946007)(1076003)(6666004)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMla4fzuaOQOwEMwyW7/tHdmhmkNZYUEnMq9MrSw+uVWYiPAUcEVCWHklzGL?=
 =?us-ascii?Q?0wcyPXNoabqFszENtqhPfDeI9sHCWdfvuFgfq1osfT1n+qxvFi0Qf5wv5Vid?=
 =?us-ascii?Q?+5YcWAzlahpDgNV3uCtwAU9Vc1rPmBfm0LyyFDy+H0emSDUgrHnjqe//e4JZ?=
 =?us-ascii?Q?lmGehCNeuPYJFEcKgxfEnKmBAoZXAYeGcd6Omo9E03svNVmjdo7n14EYdnFn?=
 =?us-ascii?Q?U8DCZ1X6CovXqtZRB5exP8ujwmyjxiJxvh8MPKyl8SIYFeA5EROU1Ws+/4uq?=
 =?us-ascii?Q?ElLQFFFac/cZz6citiexSQpn1aoZvP5gqrlFuCmViRThfs7wTcia22Br4rmP?=
 =?us-ascii?Q?irw9Gq3y12rPd8xqurjCyAlwELuKO9A1a7w4PsUkpUMqph7j90eOa8oRqML/?=
 =?us-ascii?Q?LBlJjMlEmNFQSUjQ6aKmonPoO4+wHl9qkBhFQ+hHG7L/ARLlWGXT8Cpwsyti?=
 =?us-ascii?Q?MzQ7ero0vDp84gDAS6V9dHvSLZgIhlShi9VcNGZ02xCsH34ZTZC2LPmxQlRG?=
 =?us-ascii?Q?hzXl6o0B0+lHL/ieTkyezJzkwKlb6t9BFPo0nvDXrVSI/nTYwPUoizu9W5rV?=
 =?us-ascii?Q?+iz6K97I8raZjCpoCoL8hhfIuypWVJnXyFZxmfw+2bEmXStNR1C9aGiBy5kB?=
 =?us-ascii?Q?LJejDHO1I+A2qfsyPFzmdhnUFqUSDl/O8CIHO1udAORHKl9WFSmVKVYK3SpL?=
 =?us-ascii?Q?GWzqENvSlpRTiYqnZ4v+RzJtTUIGxMoJSVq9Fo+6hDGG5yQdMQt39tJ02c9r?=
 =?us-ascii?Q?B58LlHTdTdSU3M8iNQJcg6m8kd6/EQv6SrjiP2w8BLTv98vd3KUOpA3jxhSP?=
 =?us-ascii?Q?ha2I6K45FD9zpF7zCCMhTgfGauLWix3VqrK/sXK0A06D/zcnX1muv+Z8yBKi?=
 =?us-ascii?Q?y0p/h2qedSVxtwyWDGutB9ftcr/OH0EKTh0AHTh0LMGT/XUPloEVrzZHneFa?=
 =?us-ascii?Q?zqI7Z/nN1wxDHeb8ZUh6t66b/+T/uOL2Z69rg/PJcMgTcemlosCVhsWwUR6g?=
 =?us-ascii?Q?L9ESKZcjtw5imxVrV0Orj7sg2cRC0o6qUZgG4BvVKkuQIiat5SXHkorR8D/l?=
 =?us-ascii?Q?iMO9a+jeQgyqcX+acqPDnazvlmLCfkrenjHDEWz6NV8tCuNi9eU45+xRN4et?=
 =?us-ascii?Q?i3bvgIFNwdaKxyNkhqaHvW0/a4pqG56qxcIojfkZvurQ21hBwramj4dRvkqh?=
 =?us-ascii?Q?eVKpMvARw4GUWmz5UsOKfKPl5iWLfwERhAD1eEk4b3okgcUDcV3w8JsGagnF?=
 =?us-ascii?Q?Ytoq7uqZZpUVRB+OZVeOswolPw3CBPYTuMB//z5q/TpcsQcOy5YOxrCusExm?=
 =?us-ascii?Q?6/wzcD7fXXb5Y63+tsZCnCPyoea5BRCmo5zWRbeYjwiiUp1MT0BbSqc7n/oc?=
 =?us-ascii?Q?SPR1Rhhi47t+Fwm7Ide4QfOr39+xHAyP2acH8zOBYxKvTEAmVF4BJZo3IVyz?=
 =?us-ascii?Q?6fyj0afsGqNdqIQUcXdZ0e4JCggW2WwDZqF7+a51kleQzoAoYdjTIxKouQME?=
 =?us-ascii?Q?3zKhDwH0a1hsSEHrg5Ka6wJDF47Vvt7r0o9JEK3iiaTnhVOhoAUjKuSFzebT?=
 =?us-ascii?Q?1wb5+E8o7Wrd8UC83HOcYbsvQWhJxtWujUDgoujepN0UWWBbE6X4hWnjT2Wv?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b70c9fd9-01dc-4984-1a93-08dbc0438d93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 16:54:17.4823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srqBkBNrDr0fOSah8Bjg84l2NnYQx5bJl3i+uT++Gjgf73bEWnuThCfBL5AYbJGBJjoC/zTFWf9TdjipvwcZzFxuvVCxuIDvwodZnZR/rMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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
Cc: intel-gfx@lists.freedesktop.org, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 03:00:12PM +0200, Nirmoy Das wrote:
> Implement intel_gt_mcr_lock_sanitize() to provide a mechanism
> for cleaning the steer semaphore when absolutely necessary.
> 
> v2: remove unnecessary lock(Andi, Matt)
>     improve the kernel doc(Matt)
>     s/intel_gt_mcr_lock_clear/intel_gt_mcr_lock_sanitize
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index bf4a933de03a..326c2ed1d99b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -419,6 +419,28 @@ void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags)
>  		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
>  }
>  
> +/**
> + * intel_gt_mcr_lock_sanitize - Sanitize MCR steering lock
> + * @gt: GT structure
> + *
> + * This will be used to sanitize the initial status of the hardware lock
> + * during driver load and resume since there won't be any concurrent access
> + * from other agents at those times, but it's possible that boot firmware
> + * may have left the lock in a bad state.
> + *
> + */
> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt)
> +{
> +	/*
> +	 * This gets called at load/resume time, so we shouldn't be
> +	 * racing with other driver threads grabbing the mcr lock.
> +	 */
> +	lockdep_assert_not_held(&gt->mcr_lock);
> +
> +	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
> +		intel_uncore_write_fw(gt->uncore, MTL_STEER_SEMAPHORE, 0x1);
> +}
> +
>  /**
>   * intel_gt_mcr_read - read a specific instance of an MCR register
>   * @gt: GT structure
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> index 41684495b7da..01ac565a56a4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
> @@ -11,6 +11,7 @@
>  void intel_gt_mcr_init(struct intel_gt *gt);
>  void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags);
>  void intel_gt_mcr_unlock(struct intel_gt *gt, unsigned long flags);
> +void intel_gt_mcr_lock_sanitize(struct intel_gt *gt);
>  
>  u32 intel_gt_mcr_read(struct intel_gt *gt,
>  		      i915_mcr_reg_t reg,
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
