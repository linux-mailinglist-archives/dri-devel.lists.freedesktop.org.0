Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8A5B27FC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 22:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E2A10E673;
	Thu,  8 Sep 2022 20:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0B010E673;
 Thu,  8 Sep 2022 20:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662670522; x=1694206522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4btjcoRyADsU8/crd7uprN7H8jeqwYKmNTUk3ECkaU=;
 b=aDYtLElzHkmvhiLdQmsvKxBf7+FdLm5Sq5peFkIGjbDnrT+xv8CgVIni
 1jVVxM/eRLeNqKdniev0GrUD2qodXzRch0s6bRU0C9AKIkI+noh0JqV9Y
 m+w4KRLheFP7ebnjax1kAqS9yDs6IBPygHerO+4J1GpqbL2OKLhVj506T
 JYwLy3q67y3uXUm2VjZZN22KXKYy+7KCCFmd2ELV6LPxdhqp09IwOh3CE
 0rLuqBNINklSoMGl88Df/qdexG/3cGbZE/61clSokno65LsP8kiBfFFIU
 cD31CIFFYV9KtbScJORX2KibMoiChzjIfrkQ6CajiI127PuomGwUZSujH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280349341"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="280349341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 13:55:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="610827670"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 08 Sep 2022 13:55:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 13:55:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 13:55:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 13:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdU/G5Sophy5yPfi3Cws/fft5lIROC8u70KnYvqYeM9ZgZaaSXpFWoxZX1t++vzUsi59+mXmO8hJumLr4n8x9zp+dJVRajOF6yn6JioAAu2rnbgi6K51CU7zBXyNHD2LFMh/O4WR3T6gUZ1Ycq/aW5s0lpcyBinA7P9PXXNu38oaABSX5NPFpbMKL6qppYMoL5e2hzhXxLKSnONRF/xLSiwgCVDsbx/eMf6fHslvhRF7XW6dg2aplF8+ipudENYaZ72J0ZFEpij71/K3Jpsz8dWjZlnpXNGpjgxLgJ3eVMFi0omD1DnZX747jUE6VrIqeGWRw86IG/kkwumwoGxu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQTlSDdWtTCUclzcBR03epoifjFMYYPWB4pxG6/njEc=;
 b=CNlfx1+KU6wpbMCoM2MlFSpRToTvGSmVGX2MMEcFpkz0+gd6pl4JI8sBt0Mgh6UgS+DHR9RCsXW9iEx6Y4B07Kbk0oq36EW/UebEOXGNQoZTCDuPurZTPS0hTw3s/ch34FcOxqt0Udgo22qWTA0g9TNQZ+TeF5XUpm5RxtRZmgIM9GzR9mlAjCrtIUjX1p0bGTRDkgQhuOG7huf5xe29izyGLhCydy1UVtlLFeO2RgZmF698I5yVoGn1E4q/GlWVscTz+OEyrB+7yU9VwugW1fTgEOYJgbAcpdHPi1+hEnL6CSrbFjdDFFwv6GIr2T5dui8e/VPrgQF6Ab+43+57Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.16; Thu, 8 Sep 2022 20:55:10 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%9]) with mapi id 15.20.5588.017; Thu, 8 Sep 2022
 20:55:10 +0000
Message-ID: <a57ddc3e-d706-22bb-9338-4f8835f6538e@intel.com>
Date: Thu, 8 Sep 2022 13:55:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 09/14] drm/i915: Handle each GT on init/release and
 suspend/resume
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
 <20220906234934.3655440-10-matthew.d.roper@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220906234934.3655440-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0f9e5c5-a9ba-4d52-c26b-08da91dc6b60
X-MS-TrafficTypeDiagnostic: BYAPR11MB2632:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59Dt6c7Jcf7YzNPwwbNwKNh7Cgord+mFMLNBl7eHQnDQ4Zasj/FGNf5On7+6jhWsPhQ4RCccbwGsVezWzFQUJxAKLQAvkY1+BlR3+tmbypP8ztQUXnmHpdf2Er/I1kpNpflg1sUtZl5wdLB5AGXjLT8j6Mmc7VzXwd5WU8ZtQZQdzSj5mhytQ5EOn04QOtHHP5LVh1VfX3ihxqUpApmMGDbAq0I3+YVDNik8ypPsDzMGqMRsZ+IK+LsyFVErqdwjOPdED1jxR5harpigRRVmcdn/IVylSyGvVkxSdHrgvxkFfwHLEAkQLJHi2sBjmH/ZVQuqokBR1E0sxESj/KZDAxQQQW7BUB0ZdIrKf7amp30pxA7i2KgzLRYIK7t/GdhDQxZRmGaT9AJORc6Dxc6VXpOTeznUXtyBBRfZIXWYzcgbm2DGhGcL+PooI4HpCCpRSsqMb+upXk1SzH+UeniIaXB9/foS0Zf25cXexjRGqKK8TAOOID/zCjudHK5uOKNKLOA88Lv++1ymXqDqoHbH8dZW/YE1+OM2oJhFqkvdPE19arYVoIYjCtkVHIvY8Qq4MBxMRYO/5auoTjPzadV/03ddAUgnmXjLfsDg8xYs7/2/zNRryveXfhQywjU0HLE26KIDinwouq/O63WFJIkDhLoW1aPf3o8TL4sRP5e2kz2keg32ZNNsJtW6WsoaIMc+aQTsdwyWvvs87r4OHcs9oH7SMJoIs6/BIwjkXMh3EkeOKs8aBsTkdW9ZF6iSaKP47yzRn0uPkodzw6SoenLT4uYdYLHeBlLtoVRA6sHwrDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(396003)(376002)(346002)(366004)(82960400001)(86362001)(31696002)(38100700002)(5660300002)(8676002)(66476007)(66946007)(66556008)(4326008)(450100002)(478600001)(41300700001)(8936002)(316002)(6486002)(186003)(26005)(2906002)(15650500001)(83380400001)(6512007)(6506007)(53546011)(2616005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDBXS0lmYkJqeWhpREtPa00yU2Y2VjZZRnkyUWFNT0JwRkV4OTlQUERibjJE?=
 =?utf-8?B?bFNkRWNCNi9vaWtxb0R2TWtZNHRjV3dsSFVFRktNSXNuK1lmYVJhNUZSMkps?=
 =?utf-8?B?YVZKQmtONnJaZTFuWU1WZ09BSzhabEFNV1NSVXJIaWJHYXdKZXF5aEg2N3VZ?=
 =?utf-8?B?bURoa2tWZHoyTnJwTmdQM1ZmTzNGSUZlTUNnOFA0aWhCSTIyVE8vSXVVSDVa?=
 =?utf-8?B?ZHlKSXNjVGwwQk5Rd1RhaDdsWWtZd2hZYXRuRitCWEMyRnJEUjRsUzM2Yytm?=
 =?utf-8?B?WjQwQ1g0OVIzZklwUlRZR2lMWE84T0doMWp2NWpuM1VKRkxDcmovMzdxZ1Bo?=
 =?utf-8?B?OEdvUHNldXF0VDBTNExlNTZ2eFR0ckJaYW9EaW5ySjA5L3VocFVoNjhWSit6?=
 =?utf-8?B?bUY0K24yK3pxaCtpZzdob3VNdlVaK0tHdk9DV0JQUEE0TFVqVVg1UVNuNGFP?=
 =?utf-8?B?SzdvZmY4M2VNVGZpaVh2V0cray9XNFFqY2xQSDgvU0VIYVlDTXZJdG1BbGJn?=
 =?utf-8?B?amlhMEx5bGVvS1VUa0prMkpaM0VOUnRUdjc3RU44Wll1R2EzdCs3TWhjY3FL?=
 =?utf-8?B?WlgySkEwK3p1M3B5ZWRUQ0k2bldNeTlUNmNTcGlCQ21hdTNUMlhJcDFaTkQr?=
 =?utf-8?B?eXdvRFVrUTVkQXZDcng4SkJCVEl3azQxYlRtV3N1b1hZaFBQeG1Qb3pTanlk?=
 =?utf-8?B?ZHFRSTAwS0ZXUmxzWXo0TGNLeFJOVGs3L2JabWJ0Y1JJblpPVVBoN215aUVK?=
 =?utf-8?B?UEs3QU4rZGMwQ0MwYnQwVVlKUVFQMlBVeldodWJwRW1HNWM1M083WGVEenlB?=
 =?utf-8?B?SjZabjRyZEpERXpGRGhFaHJ0RkJ3bmRheWxFbkltMXp6MDFkdjBmMnVyVTg1?=
 =?utf-8?B?TnY0MW1LL3IyRERaanp5anV3bjd5YnUydk9qT3ZhKzVxY3ZUalhtb3BiNU5O?=
 =?utf-8?B?S1dxQVl5QStySElNSEVJeW9IbW5nYzlUaHgxKys5MHdnbmRnT2Y3TTJGUzNo?=
 =?utf-8?B?MzBia0gyR09ieVNRdXNVSnQ4aHY3QktFUWRIT0FxcXhpUXU2dW5kaHh6b2Qx?=
 =?utf-8?B?Nm5PcGZTeWhWRVl0NnI0MERmeWpVOTh3bFhINEV5NnBZbFY0azFmM2Mzd3pr?=
 =?utf-8?B?WmVpc2M0WVE1WGk0bDlraFBnVk8vOFo2QWg3UXhyRU5RWTh3WWVPNjNqdjlq?=
 =?utf-8?B?Ti9wM2dhbzJEUWgxN1RiM0N5N1pxdnljQVhBRWZUdXE0WlBQSHZqTkRqSGlH?=
 =?utf-8?B?dU9UMlZPQ0REdUQ4RytUYzRMV2RNYnVYUlNzT09Gd0RZNUFQNk5KakJwYmMz?=
 =?utf-8?B?emVFL2ZsZXB2MXRSSE9pV3hRTlFCcHd3RGZsTnR5dHljcTBrOWhWMGN6VlFu?=
 =?utf-8?B?WlRkOHBBRXFDTWF1S1JuZTJkVmNpMk5PKzhoOVZDbDB1SDIxMG93ZXpVdTFN?=
 =?utf-8?B?dWZEd2hxZE1mMEVUWTBMelBiRlVlUytFQVFYd1BDT0pUZS9nR0xWdkpQTVJ3?=
 =?utf-8?B?eEtwMzhpRDZNc2Jac3p0YTFHM2lKOXJ1dlBleTRsZ1lXZUNqNXYwYXlYeERj?=
 =?utf-8?B?ZWVJMXBIMHJBREJvWFZITXhvejFCVk45YlNySEhVY1NINGd5OTRWbzNYOE42?=
 =?utf-8?B?NDhrcXduUDI3Wi9hUGQ4SEtKMU5VZVZGbmhBaVFJRmdZRlhaRTVKaTM1b3dV?=
 =?utf-8?B?OUJPQWhsSDNSbDdBQWNQNGRoM0hMYXVDT04zR0Fsc291T3VpQkZyeWpwUjRm?=
 =?utf-8?B?THpPNnZYL0p1cTZBSTNFSVhlT0FMRDdtOURhM1d0N1hRUzA5NzdCZnZqTVIr?=
 =?utf-8?B?ZHdyMTVMaUNCN0JNK1VMK011UkE0ZjFreXYrUzZpOFYweFJNdXRJY0l1Rk1R?=
 =?utf-8?B?djJ1ZDN2YmZCSXFKb3BKV2t6YTZYTHljWWdWUVF3VVR0NnEvZ0lybFd0ZnZn?=
 =?utf-8?B?dkxqVVd4NWhJZjlwMW96NXV0MHR3VWwySDFSdlNDTXNueXRkOS9ML0Y4aTN6?=
 =?utf-8?B?UzgxV1orSmRYOGprWjkwOWpQM0lma2dQM214SjVrK0c2V240OXZ1N01kTGl0?=
 =?utf-8?B?RnoyTlE1bUxBNkZVSlhyMXlBRDhBTGR2SDc0QXM3MWVrRHBzWTdtR3dMRXV2?=
 =?utf-8?B?MFFxakFESUx4R2VLaEw4aWNLTStqT0FZK1F1YWNPdFBsWm9NclJ4dFkvdFpl?=
 =?utf-8?Q?BZjfrbs/BbLrOtyi+Ms4tu8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f9e5c5-a9ba-4d52-c26b-08da91dc6b60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 20:55:10.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXjem/uPIvMihdQteVKrQSZNL6aBT9mpVcLDIWqAGkc9m8oiGZkBMNB99uKISRFW96M0WT/+WVjZUyE8tzEF3xIX3uoLznUGL1Vuo4ccsVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2632
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/6/2022 4:49 PM, Matt Roper wrote:
> In preparation for enabling a second GT, there are a number of GT/uncore
> operations that happen during initialization or suspend flows that need
> to be performed on each GT, not just the primary,
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/i915_driver.c | 59 +++++++++++++++++++++---------
>   1 file changed, 42 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index bb9ba1aed1bb..e5c3cf5045d4 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -310,8 +310,13 @@ static void intel_detect_preproduction_hw(struct drm_i915_private *dev_priv)
>   
>   static void sanitize_gpu(struct drm_i915_private *i915)
>   {
> -	if (!INTEL_INFO(i915)->gpu_reset_clobbers_display)
> -		__intel_gt_reset(to_gt(i915), ALL_ENGINES);
> +	if (!INTEL_INFO(i915)->gpu_reset_clobbers_display) {
> +		struct intel_gt *gt;
> +		unsigned int i;
> +
> +		for_each_gt(gt, i915, i)
> +			__intel_gt_reset(gt, ALL_ENGINES);
> +	}
>   }
>   
>   /**
> @@ -730,6 +735,8 @@ static void i915_driver_hw_remove(struct drm_i915_private *dev_priv)
>   static void i915_driver_register(struct drm_i915_private *dev_priv)
>   {
>   	struct drm_device *dev = &dev_priv->drm;
> +	struct intel_gt *gt;
> +	unsigned int i;
>   
>   	i915_gem_driver_register(dev_priv);
>   	i915_pmu_register(dev_priv);
> @@ -749,7 +756,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>   	/* Depends on sysfs having been initialized */
>   	i915_perf_register(dev_priv);
>   
> -	intel_gt_driver_register(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_driver_register(gt);
>   
>   	intel_display_driver_register(dev_priv);
>   
> @@ -768,6 +776,9 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
>    */
>   static void i915_driver_unregister(struct drm_i915_private *dev_priv)
>   {
> +	struct intel_gt *gt;
> +	unsigned int i;
> +
>   	i915_switcheroo_unregister(dev_priv);
>   
>   	intel_unregister_dsm_handler();
> @@ -777,7 +788,8 @@ static void i915_driver_unregister(struct drm_i915_private *dev_priv)
>   
>   	intel_display_driver_unregister(dev_priv);
>   
> -	intel_gt_driver_unregister(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_driver_unregister(gt);
>   
>   	i915_perf_unregister(dev_priv);
>   	i915_pmu_unregister(dev_priv);
> @@ -799,6 +811,8 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
>   {
>   	if (drm_debug_enabled(DRM_UT_DRIVER)) {
>   		struct drm_printer p = drm_debug_printer("i915 device info:");
> +		struct intel_gt *gt;
> +		unsigned int i;
>   
>   		drm_printf(&p, "pciid=0x%04x rev=0x%02x platform=%s (subplatform=0x%x) gen=%i\n",
>   			   INTEL_DEVID(dev_priv),
> @@ -811,7 +825,8 @@ static void i915_welcome_messages(struct drm_i915_private *dev_priv)
>   		intel_device_info_print(INTEL_INFO(dev_priv),
>   					RUNTIME_INFO(dev_priv), &p);
>   		i915_print_iommu_status(dev_priv, &p);
> -		intel_gt_info_print(&to_gt(dev_priv)->info, &p);
> +		for_each_gt(gt, dev_priv, i)
> +			intel_gt_info_print(&gt->info, &p);
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG))
> @@ -1230,13 +1245,15 @@ static int i915_drm_suspend_late(struct drm_device *dev, bool hibernation)
>   	struct drm_i915_private *dev_priv = to_i915(dev);
>   	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
>   	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>   
>   	disable_rpm_wakeref_asserts(rpm);
>   
>   	i915_gem_suspend_late(dev_priv);
>   
> -	intel_uncore_suspend(&dev_priv->uncore);
> +	for_each_gt(gt, dev_priv, i)
> +		intel_uncore_suspend(gt->uncore);
>   
>   	intel_power_domains_suspend(dev_priv,
>   				    get_suspend_mode(dev_priv, hibernation));
> @@ -1368,7 +1385,8 @@ static int i915_drm_resume_early(struct drm_device *dev)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(dev);
>   	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>   
>   	/*
>   	 * We have a resume ordering issue with the snd-hda driver also
> @@ -1422,9 +1440,10 @@ static int i915_drm_resume_early(struct drm_device *dev)
>   		drm_err(&dev_priv->drm,
>   			"Resume prepare failed: %d, continuing anyway\n", ret);
>   
> -	intel_uncore_resume_early(&dev_priv->uncore);
> -
> -	intel_gt_check_and_clear_faults(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i) {
> +		intel_uncore_resume_early(gt->uncore);
> +		intel_gt_check_and_clear_faults(gt);
> +	}
>   
>   	intel_display_power_resume_early(dev_priv);
>   
> @@ -1604,7 +1623,8 @@ static int intel_runtime_suspend(struct device *kdev)
>   {
>   	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
>   	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>   
>   	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
>   		return -ENODEV;
> @@ -1619,11 +1639,13 @@ static int intel_runtime_suspend(struct device *kdev)
>   	 */
>   	i915_gem_runtime_suspend(dev_priv);
>   
> -	intel_gt_runtime_suspend(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_runtime_suspend(gt);
>   
>   	intel_runtime_pm_disable_interrupts(dev_priv);
>   
> -	intel_uncore_suspend(&dev_priv->uncore);
> +	for_each_gt(gt, dev_priv, i)
> +		intel_uncore_suspend(gt->uncore);
>   
>   	intel_display_power_suspend(dev_priv);
>   
> @@ -1687,7 +1709,8 @@ static int intel_runtime_resume(struct device *kdev)
>   {
>   	struct drm_i915_private *dev_priv = kdev_to_i915(kdev);
>   	struct intel_runtime_pm *rpm = &dev_priv->runtime_pm;
> -	int ret;
> +	struct intel_gt *gt;
> +	int ret, i;
>   
>   	if (drm_WARN_ON_ONCE(&dev_priv->drm, !HAS_RUNTIME_PM(dev_priv)))
>   		return -ENODEV;
> @@ -1707,7 +1730,8 @@ static int intel_runtime_resume(struct device *kdev)
>   
>   	ret = vlv_resume_prepare(dev_priv, true);
>   
> -	intel_uncore_runtime_resume(&dev_priv->uncore);
> +	for_each_gt(gt, dev_priv, i)
> +		intel_uncore_runtime_resume(gt->uncore);
>   
>   	intel_runtime_pm_enable_interrupts(dev_priv);
>   
> @@ -1715,7 +1739,8 @@ static int intel_runtime_resume(struct device *kdev)
>   	 * No point of rolling back things in case of an error, as the best
>   	 * we can do is to hope that things will still work (and disable RPM).
>   	 */
> -	intel_gt_runtime_resume(to_gt(dev_priv));
> +	for_each_gt(gt, dev_priv, i)
> +		intel_gt_runtime_resume(gt);
>   
>   	/*
>   	 * On VLV/CHV display interrupts are part of the display

