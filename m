Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3A601430
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E6E10EB79;
	Mon, 17 Oct 2022 17:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBEC10EB79;
 Mon, 17 Oct 2022 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666026193; x=1697562193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HeQI6CjeR8T3gaLwLq0yoVKYRKJimOzK8oGgl0R1m5Q=;
 b=OGEHQb+8XTrV9z9jhu1ocHPZeP9z0iLjtNFzdcag4KG1Tia7YoUuEOG9
 HlCu7LsFRKdJKmpXRnoJ3myKNHsUnpNCvFi8MAk57yCBpTbUNgBXpLedk
 tjL98F1P19k6gKiTb0gCIqE/dFLBAGcsZ0np6WQgw7KdolH/stXO6dw2x
 dtzcw8Un3U8frqopVsSlQCbmElRcnWpGHjinCpXU9j6IkSYxI0GrclSua
 0yGlis3gDPt5ybZd06RJZP7nGslfOSALdAv/SmZsGvFnody3okQfpqFWt
 t+WtHOgC1nIMKaXTdjGtwZ/GsxTarZdCJ0hJgMP4wHyUk7sNM/skygBDW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="303473121"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="303473121"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 10:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="873542080"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="873542080"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2022 10:02:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:02:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 17 Oct 2022 10:02:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 17 Oct 2022 10:02:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 17 Oct 2022 10:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJOJhllQNUMDCkCY4AWa+NnzvFtUlD3IxTgCHO/BgWUT05FA1XmSxSO/aQNspSQ4+uNqo62VQiJYj2raQjOomQwh2miMirPGxrMwVrZ3zTO6Z4aq46/BsnGakozj4olku+yScEn/QBd4CUMxYMxVpNz24573YDbvODnhBZARWEyQ+TJvDuGfKG0Rl0v1KKOJN206uhaVfqMRhiLnT+5gZgJR04B0js/uA5Z2is5ZUegH1DXLYmFYw3r0JmB//tyRSlQ/uO5hse76GgOvbg0chTEdJtqRMRYqg16YsXRgCy6Qx3FRRqsKc7JlfjkHm1xsEQJ02eHLF8C/s5NkE+QF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdkbezskTIHhYlQ7PFFgXoPfChZcrwWW808JQbWyFoY=;
 b=V+aKK5Kgi6P/sHJ7ozxPnec6LZS6eNWGjMjWnKTwBBrcLdSAiblW06ZwgS6b0Tqi/Y9v5PyJr2m93NFsJgyR2WqMcyNAX/iE3Pk8VUt/PRZQqAehzXLvZOSkelQGaJo8IEq19nMAICIVRN6PfL8BOw65p6y6Zn3qR5Y09u8Kjsj+3CqGEDXpeD1c3ZO6/aQr9uA/14gCLFMkcRDvOSKRNoGOEJS+sJxS6PoF6QWaeDEOtyNrh5LtiOwFxfV8MeBuzWi0xnDq3smhm70YUM03va0Bixr6j7VkS9oksszg7WUC8VHha0CqWWLr/RKAftk8lfotqn63BFOXRGo9VgRC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SA1PR11MB5804.namprd11.prod.outlook.com (2603:10b6:806:237::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 17 Oct
 2022 17:02:40 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::c0e8:f5ad:37d:ee67%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 17:02:40 +0000
Date: Mon, 17 Oct 2022 22:32:30 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v3 14/14] drm/i915/xelpmp: Add multicast
 steering for media GT
Message-ID: <Y02KpllpDL9HVN4Y@bala-ubuntu>
References: <20221014230239.1023689-1-matthew.d.roper@intel.com>
 <20221014230239.1023689-15-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221014230239.1023689-15-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::10) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|SA1PR11MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b92baa9-9fcc-4572-ddd2-08dab0616665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oPeJdVI5mABswV3IfmuzqFh9DIC4MAIbqpomz3xgUlG5PeXrb7/eKtsKMcFt5sryTnsztxJSgMJAKuDfXYJDtbZTO/HAbISMab4Ihu0TJOazG2k9+zi72J9KA/vZFGqSLvwL//si5eMk6IUVYLYRDdCvgGEFJ1qQZWbq4UfkgIq/mJrfLDCH7yL7QkAT7lR/VTBkGC/tYuLZ1EOWwwpV75waWUpPghwNaOy25VzCVGHip7/EKFXgRxPUZ750BA0RkeFtOgblOD1eQ5FY7c5MUmOhhO5mTavut1EKlOck0EtZPWciB8aMGr24v7RHfkdVfmQecpSh8bvzWWlveaMVA26XGsNA8+fieHt555uclml5MOV+exL5Y6gXwl1uNVs4sV0ynLUjdh/bTVeECKDuKidBU5S5YHfFpu6EJ46sf8N5/m81tAlQstplkZhqlv06bWaCnCmt+pRSVfKFlvnCzYiPMAxnGmgsLyFqXc0tfsV9HhF9z6RyV+6dSff7Ey3cqehFL4KrIov7FOB5EPtLUoHyFgr0P6o4xoIg4NXAuSYznjeVVPfr9fjx6MW1gRSkEMDffU5Oftqk1Or/OvBLjze4DghdQmtRwJ1VKNczY25gB8pxKtiTpbSLX3DE1/UjLmhT1eMJvk41YxxOvuXxc5JSL91yEwOndOOJbawajwWKuBTTLa0/cwPrRGTvl17fN4bTtcxthMixjrSorHsnNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199015)(44832011)(41300700001)(5660300002)(450100002)(26005)(478600001)(4326008)(6506007)(6666004)(66946007)(33716001)(38100700002)(82960400001)(86362001)(8936002)(316002)(2906002)(9686003)(53546011)(8676002)(83380400001)(6486002)(66556008)(6512007)(66476007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THdCc05iUXdxdjZsbExLemRWK1l0TmcxNUpPS3E0Ly96VFhsN3p0SGpHMk1n?=
 =?utf-8?B?eVdIalV4VE96OGJhR04wNncyR3VEVExFZ2h5L2oyK1VtK09laEFBWm56QnlG?=
 =?utf-8?B?YjVYRS9BK1l6K2RNMDhjdGRKa0IxY2E0MFNQa1BicXQwRkVVVGFheklNN1p0?=
 =?utf-8?B?V3AvcVBFaCtUNnBUVEpETGVhRnVwemNhMmZqR3Q4Nml6aHhtNEVaOW51YWdZ?=
 =?utf-8?B?VDVLTUpYeHB1SXhBSS81QXdqY0tacHNJdmk5d2Rock1zSHFjWTlGd0tsdm5M?=
 =?utf-8?B?QWFBc2g1MU8xY2NLK3dpTmFUczhHR1FPNXR1R3hTY2FJVXFqdWJXcERvRlhZ?=
 =?utf-8?B?Rk82VTNxU29vQXk3anh0WFBFaUpkRlh6cVRVM21hTEVlNk9xRUpuWWwraHdq?=
 =?utf-8?B?d0xRZDB2dHB6czFrb3JMU3ZMc0xrNE9majUwUW4zL3E0RnlqNnlGcHZuSTBI?=
 =?utf-8?B?VmRMMk42eHFNUExSU051RXhMdHdvVnJoTUtndlJLUjlZd2pUbUJ3MlVPVTVL?=
 =?utf-8?B?bmpIbnNLUldWcjFHWlhvRHRzZlAxakw5R1FvNmljc0JEa2U4cTc5SnVNMERo?=
 =?utf-8?B?WFJQQ2lQbVplMTRlY3BWQ01Sc0tENmlNNWhJeHJRR2dKQ1JkbEpFWGdJYTN1?=
 =?utf-8?B?OVlJN2haZTF2YlEyM3BJSENPOEN5SFc0NGszRjNibnFKZ0tlaXFpVk1KR3Jt?=
 =?utf-8?B?UkltdnFGOXQ1emIrV0MyWW9OVitMSmNmWjYra1lUeHc3bTNrdnhlTWp4VURs?=
 =?utf-8?B?a1M2d3pQVGlQWHlyODRGT2ZlRCtzUVB3MSs1OGpySXdQVE8rZm11NUJzWFFL?=
 =?utf-8?B?YXZJWmozWUgzb1dLVGovcktWc2QvV3lycFk4ZWUvUHZac3RtcWJUb1hZQlZi?=
 =?utf-8?B?RmdTZGRpYmIwUWxWNUFLNDBzcHNUY2xjQUp1RzJrUDliY0Z4ckRvbDVEREV6?=
 =?utf-8?B?djFWWlZyY1EvU2ZjU2tFVCtuRlFTeUw5RDlJb1ZDRHUvT0NjQ0Z4Wnp2eEdI?=
 =?utf-8?B?eHBMM1lrdERUbkU3NmVybVFCSTkyK1R0Qmx4WHhlOFlvS1hyN29TalVOMU5l?=
 =?utf-8?B?R0QzYTQ0MjVLWU9sdTFGOWgvOTUzRmxCL24xdGE1VHJXZFhnZHdiL0ppeG43?=
 =?utf-8?B?YlJhR3A0ejlZMnNZRjNJR2l3VjZGdy9ZQVBmS2dLN1ZIeno5bHNSc3RqNFps?=
 =?utf-8?B?Sjg2bnErb2pGK0VNNlVCWVBCZWVlSG5TZGUwbDZ3bFF6MUFGRUpVc25nV0sr?=
 =?utf-8?B?b2FyakkrM2ZtMDZNSjIrWVJwRTUyWU1McXBGZ2d2aXd5SE1FaGN5eE5wamg3?=
 =?utf-8?B?NjlQNmw1ZUEvSmZGcWtXZHZ0aHBMMmUrQm5Bb1lUZ0hrbFlkSEtxZ2pYajVT?=
 =?utf-8?B?eDlFV01NRTRnZ3VDWEdzbzlPekZMbFhWSkdJZWkwZm1BRzR4SHRiNGNMUFVJ?=
 =?utf-8?B?UzJMVmp0YUFVSHByNXlLSW1EazFSMExRQjV3bWR6Y3haRlVOaEM4UWVBbXQv?=
 =?utf-8?B?U0JSeVhtQmR3YVkvSDMxV09wclBtQ2dtY1dOSkZHWVB6VE1PRFJLYmFqUm9q?=
 =?utf-8?B?Z0lNM2FUM0p4RXZScGpWOUxubVBrdThCQjVtbDVGOG1GT0VzSUp5V2w3UnBu?=
 =?utf-8?B?MVJ5TFFPcVBSbVVWWWJzRytpTHhGUVlVTGdhTHFHdXBvUUNsNnE3OE9ZU3VV?=
 =?utf-8?B?ZFBlSG1TMUFLdkNKSVFUM0U2NjkzNHZVZ3A2ZDVIN2JDUVVSTmZncGpQZXJt?=
 =?utf-8?B?TFJ5WTU2Ymh0cTdjSGxMdVMrSm5qZnE4OHd4dURwbUlxZndRbzMrMkg0S2FV?=
 =?utf-8?B?QkRLakZXK3RPbS8rRndrb0FUa2pOd0lzQURQWWZBbFRrZlFSY3JXVlI2UDlq?=
 =?utf-8?B?T0lKaUxVSHhOc04vQ2V5VzlCc3phNThmTU14Mjh0dmJkMy9BdmM5Z0VvM3N0?=
 =?utf-8?B?VVRXQTE0azY2dUZoOWFrWndlejU0TFkzUFVNRkZza01abE92WEJLY09Hck9I?=
 =?utf-8?B?ZFkwWkl2WkR2aHJYcGJ1VEh1SkNzNWFLYXpPMVBzRHIyV0R3algvUlJ5WXBh?=
 =?utf-8?B?bFFVWUl0VXpnT2tCUnRkWU95SkNwNmdBWDZrQjlpYmRBcjd1bWdqZ1B3UEk4?=
 =?utf-8?B?eUhJenBHMm1RbUxScHNWN0kvNnlXNzNrN0tvVTd2d041TTc0d2pLQnRkdUxh?=
 =?utf-8?Q?Gx1qxQt55ZIsliSfLPiO3QocbeKuKR3q5FLlktFzvAAr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b92baa9-9fcc-4572-ddd2-08dab0616665
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 17:02:40.4332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yr31h8LHY9lkfwcIu7WFGZooRwM0QrPoiXvpTwT3TRjPJdWn/h6FytsAiqMazYhugRV5YvqT+ixAGeRV6A7cOE1zaT9BdJWBzN/i57Mbv13yMQYuCKUYLRG9evor8Gji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5804
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

On 14.10.2022 16:02, Matt Roper wrote:
> MTL's media IP (Xe_LPM+) only has a single type of steering ("OAADDRM")
> which selects between media slice 0 and media slice 1.  We'll always
> steer to media slice 0 unless it is fused off (which is the case when
> VD0, VE0, and SFC0 are all reported as unavailable).
> 
> Bspec: 67789
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 18 ++++++++++++++++--
>  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 17 +++++++++++++++--
>  3 files changed, 32 insertions(+), 4 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index 23a1ef9659bf..0d2811724b00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -42,6 +42,7 @@ static const char * const intel_steering_types[] = {
>  	"LNCF",
>  	"GAM",
>  	"DSS",
> +	"OADDRM",
>  	"INSTANCE 0",
>  };
>  
> @@ -129,6 +130,11 @@ static const struct intel_mmio_range xelpg_dss_steering_table[] = {
>  	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
>  };
>  
> +static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
> +	{ 0x393200, 0x39323F },
> +	{ 0x393400, 0x3934FF },
> +};
> +
>  void intel_gt_mcr_init(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -151,8 +157,9 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>  			drm_warn(&i915->drm, "mslice mask all zero!\n");
>  	}
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70) &&
> -	    gt->type == GT_PRIMARY) {
> +	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
> +		gt->steering_table[OADDRM] = xelpmp_oaddrm_steering_table;
> +	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
>  		fuse = REG_FIELD_GET(GT_L3_EXC_MASK,
>  				     intel_uncore_read(gt->uncore, XEHP_FUSE4));
>  
> @@ -514,6 +521,13 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>  		*group = 0;
>  		*instance = 0;
>  		break;
> +	case OADDRM:
> +		if ((VDBOX_MASK(gt) | VEBOX_MASK(gt) | gt->info.sfc_mask) & BIT(0))
> +			*group = 0;
> +		else
> +			*group = 1;
> +		*instance = 0;
> +		break;
>  	default:
>  		MISSING_CASE(type);
>  		*group = 0;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 0bb73d110a84..64aa2ba624fc 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -61,6 +61,7 @@ enum intel_steering_type {
>  	LNCF,
>  	GAM,
>  	DSS,
> +	OADDRM,
>  
>  	/*
>  	 * On some platforms there are multiple types of MCR registers that
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 711a31935857..bae960486872 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1598,14 +1598,27 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  	debug_dump_steering(gt);
>  }
>  
> +static void
> +xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	/* FIXME: Actual workarounds will be added in future patch(es) */
> +
> +	debug_dump_steering(gt);
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  
> -	/* FIXME: Media GT handling will be added in an upcoming patch */
> -	if (gt->type == GT_MEDIA)
> +	if (gt->type == GT_MEDIA) {
> +		if (MEDIA_VER(i915) >= 13)
> +			xelpmp_gt_workarounds_init(gt, wal);
> +		else
> +			MISSING_CASE(MEDIA_VER(i915));
> +
>  		return;
> +	}
>  
>  	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>  		xelpg_gt_workarounds_init(gt, wal);
> -- 
> 2.37.3
> 
