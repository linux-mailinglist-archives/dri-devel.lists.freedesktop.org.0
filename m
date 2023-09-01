Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B59790246
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 20:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC6510E1C1;
	Fri,  1 Sep 2023 18:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95EB10E1C1;
 Fri,  1 Sep 2023 18:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693594529; x=1725130529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Z0nDJ/rfDIVLUKcgkKbWtr7VKLf9LfrU4Nef6P705w=;
 b=LSOKZcbCj+kU/cxeuc3c+XqOv33iAhLYqE/fLnEg7ABvVOwY5bdNKfF3
 PxqkRv1mA+q/ZVteX6mDUAqqRtJAk+q3tEUqtp5U9NYpKa4hqM+DaIGgD
 jHrpWwqFxowvYL9vWdDWk6/KUf9sfV1OKtpPrU1bwzeTPRVaG8a+eonAs
 0xyj+fEIwcPpOfTLlXJPRxeRkYTBLwRmB53jRKcjDsQU+pE1naKYKYclw
 GYedYrxxzIqbfoIhZzuckfEN+yRbdxvBKb6pdfjBRu7Zep5G+ESHojwMu
 O3HH+F0pah8Vy4txmo3Vjx2AJ1BHnlh8ztambKOtecHwGRNLVm1hBcghl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356593334"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="356593334"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 11:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733609261"
X-IronPort-AV: E=Sophos;i="6.02,220,1688454000"; d="scan'208";a="733609261"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Sep 2023 11:55:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 11:55:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 11:55:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 11:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O91CL8gxHCtAKmCpI67JS7gm7ugkEEMg1zglxC3bluxtJAIqCpGu6+VgXtVwnc/lDffYK04ceB+cPmpfWZ5J6mJ2Pms6H0iviedp3dvxK+o4+zPuLI7BX0yQzwkRaWbzg5ah4g7e2+nuGtNy5ta6W+3556y+I2Hu2ukn6ENHEqe5ZEgpLvMiy6AyNfoPvMu8Qca6ORy0o5yUeQ+pi8SpBXs9yU9K+CyaoP+08Jh7ALrsNzkA+6MKgMRKBq8tjECt7NzhDuKJTSr1PclezTwP23TV/2ECXN03ZcAwF+d5pdUjQD2yQzkYAH2DeoK/hAJ7s/kChnrYtrNmAhf+I9n2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCiQizVSd0tpiBq1dAYrVxX0YAHwtQzn4F9H0i7WTrA=;
 b=l3Hu7GlMNWnCplJ9CVrw2Hs/FZ//VqEtAyfsMN1Ox+94sDbajUs63N2ELFuofZTsjEUR2CQvYk4V52VNB6Wq3pKgYBwDIC4lfWf3mDqf3gojl0iLUUnmwu/PNTLeD/kC/3mX5CLtlNAR84XTXmwMRUW5rWzeIM9oxxMThDSq8svQHXy3+aduLu6t3zcQzz2qg0Tmt8+TI0NnusRIp4uKf9BcMVSEVGKqX+t1LpKFMD9H4A3neLVbBjTDmCMiuMJ1mANeqz55uIXj/tQaoxKWGIUolQaZPeY96MXKuewrF4aPEhorYkzbvlQ63O5lhsY4ho4wEgTD2rulXwFrqN5ZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 18:55:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.026; Fri, 1 Sep 2023
 18:55:25 +0000
Date: Fri, 1 Sep 2023 14:55:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Gil Dekel <gildekel@chromium.org>
Subject: Re: [Intel-gfx] [PATCH v4 5/6] drm/i915/dp_link_training: Set all
 downstream MST ports to BAD before retrying
Message-ID: <ZPIzl/a60uD4FTRI@intel.com>
References: <20230824205335.500163-1-gildekel@chromium.org>
 <20230824205335.500163-6-gildekel@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230824205335.500163-6-gildekel@chromium.org>
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f1ba074-7758-480f-18f6-08dbab1d001a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+1vpzq7l++8QqehE4AiwuDWf7Koc2gxBS9REy/A+B7GwJgFrm18LBJpJ5vnKBsu4kB3XxarUFLa/ox3UJW91VZ4+t+I0+aMYihVPwl4lDixkF1hVPTCL75KmnfEQwKFvq16LoIHgqoIsREgOY8A6LSsUXB6gmconYydM8yuR0mxzCUZzzGnldq1XT0nL3iW/BjGHPkhpAQTK04qdecYirZTkXbrlmTww0SA7/e3OGQPl4lX4CwGquYSZIEwpj/BhqMWhfCM59inspCYO9k/OdxyVHWetDa/XVRuZ0vSWlPvF1L5WgDjcZRiJBTr29en2CX5bHV7oT0LOGfzJmwbMr+pPq4C89N9XOnZ5uBfnC3JR+jPbvgnn4UZnGlJAD3DDJcsrc98R881loObjRHdlRcdTZdZluqPLbQItWjEeDG2/+OvDg12a7i7Uoe0HFpq2aExqIwmzAV5xToWbTlCkqa9redItZdQRj/r4PS4yw/Xrv43VUHJ72Pur/Is2Mc25P81OZ2SEzaKnhk9UrYxe0snm1UKCQSWdcpF9Bdo1k7mf5YYS1ONHpEUsFVGcY2M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199024)(1800799009)(186009)(82960400001)(6506007)(6512007)(6486002)(6666004)(86362001)(36756003)(38100700002)(2616005)(2906002)(26005)(83380400001)(478600001)(66946007)(8936002)(8676002)(4326008)(5660300002)(44832011)(6916009)(66556008)(41300700001)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W95O+6l7bZ54t32GoknoP7YN7pTX2ioq3AkKbTZkz537Kkj2kvv7xmyI+/Xu?=
 =?us-ascii?Q?QsI/H+3MYs3701ezZphjuKB/dYzbeGodhB8CeI4no4Dj9rdJx0HK0lNVWBJT?=
 =?us-ascii?Q?vDXDOqItN3l/H2R/KklSrMnsqea1B5T7URQrpVjYkN6QT8Dau30eJENsbZ92?=
 =?us-ascii?Q?nAhYL+4vNuRyIg4Gx/uGLhy8Onvd4GYzZfBHEtnhciryuMgF2B1JLjNoBpF8?=
 =?us-ascii?Q?ZLl3r9TqyR+pINvQY8UrSfPYZerTNCBdLHgTvvTG2Wn00StS7vIEAqgf9Tpu?=
 =?us-ascii?Q?mDpCNoekUYN345OXAVvFZWQpcExymi4LVPZGwCJS0pxGWYpcuTXReWOcOgYX?=
 =?us-ascii?Q?Rd9e1H/4KnxIK9fb5EqmG6KwVKR78J53mgkcQa2Ut8t11WFmqutu7hVgclmw?=
 =?us-ascii?Q?V+AoEWncjS7D4aHjvyGRVNoONJPy5HvD+sOlZroKLU8gzdiDzZgXVG0T/BsN?=
 =?us-ascii?Q?APG+rUiaVlR1c+J88IymhGvTx2Jijox52Zb53i6aU6aJDgv1c8DBDGNofpin?=
 =?us-ascii?Q?2D63XzXUrYw2Wcma/WFuZfdaQR0p6M+f18Ae/1k8XgocbeV5rIkSWzHgKU01?=
 =?us-ascii?Q?9TORaAaaT7AEtA/rMy0bqZVbd+aqbWFqwTQsDrzAPsKgEJiaVCALjdcXo/X5?=
 =?us-ascii?Q?Li6JMxGVAOfys7VGBHNXPoowRAyM3DxmW+l3Bc9eTD6woSR+Nt3HOnBXbPE+?=
 =?us-ascii?Q?GXgb3YUBUXInWH0P1nifEmMiD17HSUsBURbi+ei5GoaJ0bBOZQOwY4wOCNe8?=
 =?us-ascii?Q?R1ZgjwtRuSB8qLmGUGi2jZxMXYd4o1CiED8ZoT8yO9YaoMkg/X8Ken8NZNQm?=
 =?us-ascii?Q?BAxQabfRns52pswuSUFiTSY/ASLW5V2wHzGlreFPZxPOmjl83xndrlkT74bX?=
 =?us-ascii?Q?ZN84UNuAE6/jxsyjYjuVxvNlvb57o1xwFZCam7jsq5MkD2mrlwHmQ/fKioeA?=
 =?us-ascii?Q?JWZX/eHrN6GOqMrFsywDEJe3CNtSA44De6JxYkmPPoSIx4YSs5mm44kOeop0?=
 =?us-ascii?Q?8ZVABYtGFJcgQFJ1X3aO92UC6QqPpRprnfL5ehRZxsIOCM5ZXYwLVsSylaJ7?=
 =?us-ascii?Q?NZyLZOM9kKJbj6LmT7sLQsMhw8DTzi9ia+/KIMW16zMm4oi+jT6boKHwG8U0?=
 =?us-ascii?Q?zDcsUiR9PfG54jkpvRwPeoGo6T9GG+YRXcNmpQcdYLbN2HWLuip8kPIDmLcx?=
 =?us-ascii?Q?jl+YD0Mlk4JhhHS0FbrT6rDS9uHDi+K8L/5tZesSN4ZwN5duI4DqQVkzOVA+?=
 =?us-ascii?Q?xXnMXafLz0kQ7CqP/badc36leNwemzix6Qv6fcU11kcJvDWZyYjQo1UkhVYM?=
 =?us-ascii?Q?o+cr4whKxcKy7yhYmn36QZjZQxyPbY2OWqk/LztKCTxnJ5yXKewXRT4IRCxh?=
 =?us-ascii?Q?PAnhCbu4uDQ9KC5QtdfoO0blEW5gHKDrKCQGdajAKuUDhNYBDc6u43o+tLvD?=
 =?us-ascii?Q?4OsFobwF3Lc6ImHPaQ3rkNcsCM+FIRt0xQntQZ1BsRwK8OaxhcIBv3WG5wEv?=
 =?us-ascii?Q?QzY/jdA5EuhnBe18fwydJtWdWC7xar6vbvxsqgDNMLe246qbNrkvMI9hkC2e?=
 =?us-ascii?Q?ZsJQ1Y8WY5vxAMFU6yOEZqxpT6sHdo2+fYKeVw74LHc1ozAU1J4hCuEeE7Vm?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f1ba074-7758-480f-18f6-08dbab1d001a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 18:55:25.0690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QRAR2iotTjsAkhrHKH7z7FCjyEw6xeSkCvJt9Cb3n7xCP7Ef/QhaDkQER2vw5xFox4gSSVo45SCSaM0WL2ULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 04:50:20PM -0400, Gil Dekel wrote:
> Before sending a uevent to userspace in order to trigger a corrective
> modeset, we change the failing connector's link-status to BAD. However,
> the downstream MST branch ports are left in their original GOOD state.
> 
> This patch utilizes the drm helper function
> drm_dp_set_mst_topology_link_status() to rectify this and set all
> downstream MST connectors' link-status to BAD before emitting the uevent
> to userspace.
> 
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 42353b1ac487..e8b10f59e141 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5995,16 +5995,20 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
>  	struct intel_dp *intel_dp =
>  		container_of(work, typeof(*intel_dp), modeset_retry_work);
>  	struct drm_connector *connector = &intel_dp->attached_connector->base;
> -	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
> -		    connector->name);
> 
> -	/* Grab the locks before changing connector property*/
> -	mutex_lock(&connector->dev->mode_config.mutex);
> -	/* Set connector link status to BAD and send a Uevent to notify
> -	 * userspace to do a modeset.
> +	/* Set the connector's (and possibly all its downstream MST ports') link
> +	 * status to BAD.
>  	 */
> +	mutex_lock(&connector->dev->mode_config.mutex);
> +	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] link status %d -> %d\n",
> +		    connector->base.id, connector->name,
> +		    connector->state->link_status, DRM_MODE_LINK_STATUS_BAD);
>  	drm_connector_set_link_status_property(connector,
>  					       DRM_MODE_LINK_STATUS_BAD);
> +	if (intel_dp->is_mst) {
> +		drm_dp_set_mst_topology_link_status(&intel_dp->mst_mgr,
> +						    DRM_MODE_LINK_STATUS_BAD);

Something is weird with the locking here.
I noticed that on patch 3 this new function also gets the same
mutex_lock(&connector->dev->mode_config.mutex);

Since you didn't reach the deadlock, I'm clearly missing something
on the flow. But regardless of what I could be missing, I believe
this is totally not future proof and we will for sure hit dead-lock
cases.

> +	}
>  	mutex_unlock(&connector->dev->mode_config.mutex);
>  	/* Send Hotplug uevent so userspace can reprobe */
>  	drm_kms_helper_connector_hotplug_event(connector);
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
