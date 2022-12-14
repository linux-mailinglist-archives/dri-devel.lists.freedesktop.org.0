Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA864CE91
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 18:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0276B10E438;
	Wed, 14 Dec 2022 17:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F8E10E437;
 Wed, 14 Dec 2022 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671037284; x=1702573284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MYkPJRuibqAA0xi3Kce4QoBB8hfJLHeu9auds9/eRuw=;
 b=WSGsGoQsIr4K8NeSqrjC2J7XWNoehzlw1/02PJHuPW0sVikSp6ucFwPU
 zU7yy/i/eTqCUf4yFxOorovNVK6W7SAkE5uGg8M6WdqCLHpNX2VCDPT8A
 DCG6ZlPdOsDAocgbVosdSrhhUgw9HXrm4R6SvRo7z90pyOa0M/kbNx4ZU
 GP3JNBnZs/zqHORW7OrAyw0npH43/CLVi0F446N8sR/mYR8uxUlQMq46F
 h67gpyBCJjOJChpzUv5M39vReV2iQxBJylVTwxLsCBA9CH0Tqo8zFPvWe
 AXZuve/g90aAsmS+6qJCjiHKTeisuqcszNl1GwnE5d2CHJSAy9MGs+5EE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="345535515"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="345535515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 09:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="679795377"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; d="scan'208";a="679795377"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 09:01:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 14 Dec 2022 09:01:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 14 Dec 2022 09:01:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 14 Dec 2022 09:01:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPbMCKPjm7zD2bTvBNuHcsFxku1j0+0DFFFNJau/gYnJyHmv951hZZXZoqk7b9Dl0e/ZPMz1PmADr5SHLXxanJKcPwS3URkq5zRwj3vQ7Ek6grZiXMyIC2CGYeGw4sBkUo8Rp9oSlTXX+Ya3n2Ai7K0PqJ1UVobPllFMTpRKDL8PGY5CX3QCj5e/LyioaBEyJzthNMpswuR6uGWbgJ+IkE96l/Cm+C6ItHPfBEPJIiGxlmdtCR9gK0iniCqQWYqruoHGrhZFe9t36mB70ZpV12kNkjVdO6rdUten63oXVs9RQGmLamkRcwXHXvdmSRkH0U7N00yiFNSNsaXeR5Zcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddn/aGfaREyMEE6I3tJCjlCMa+3YeDozHjttvUiqCyo=;
 b=dI+rPDo5GgflQT8YgBKxOzkeb+H1J5gQSsKHWsi72qWD0+J2dqSazwq1+cdGvCq5vA6KKFvaqPDUtbsC3PiQt874SJX3KEVbsU+L/0DBnL9d7QkohpEHTH6HEFcADnxQdGBzTYCyCPnJzTGba5uXkgOL1DAlBdh0E/qMWxcLYDDJBAdoQ4zrtwp+dXd0JJciT7E0tkwTs8sfc6yGmSpBpZ056vCyOdPvtZ8jFirP9XZlO/EURbbFNDIRf50dlcTomkY6iJ1TQn82518BN7ydpXrvnvsdKxcl3WoE0H43FjzaV1slCF8O+AdVRupAYeVZ60kOzKil71BskMo/51bumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 17:01:19 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::566e:4cea:5a48:58a]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::566e:4cea:5a48:58a%7]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 17:01:19 +0000
Date: Wed, 14 Dec 2022 09:01:14 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dg2: Return Wa_22012654132 to just
 specific steppings
Message-ID: <Y5oBWr5mMR37H+of@msatwood-mobl>
References: <20221213234119.2963317-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221213234119.2963317-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:a03:80::41) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: d313f7ca-e524-4b35-ce8b-08daddf4d1af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c4RraUQ+1Flh6T0IBLHmY5giIVMxlDt+EiflY2jiXo/s58q+zoxr7ZXXrChfNTxGPSGowMq1qqEhzqOuwpKXRtXYzjCo/5vpqFAJMP0cRyF9Be/lLea0KTGxeyUf30zQENSCVJzZp+Nb9u3XuEK7EWTf4h4cS17/N0yGT4UnG5aBmHcIphqD7DnewVfCTWxQW4e9ed9BxQ2g9mfGW4FK2KI0vxiDM9ic4If8YTkpzFzk9anEyLzOpM0ZJ2/PergGH6jIK0R/c34A5XA2qPXmQWEW0Va6RrHiW0OZH22putod+uXVwfbkDaifksCK0Gb1uIwPAPzQvsT0OqqsAeIfaVGBYYPfdRbImCjMwrcre3KG3nJ7VjivPV389E/UINjhb/bCf/QDN63nZ6H9qRfBUmlaK5jtMg5l7NNLd4D+kANN4J+D+pcPwPclHXsQEIQUtUX/1/AZnjRSkF3BWc6Vs53k+IEK0xJpn7lku6AmuX6hzlXYRF194uyW7EspuFvLZymnG50qo/0HIwU7s9Raw0SoOewXKsj/vT4LRKGpc6wditV2Mjvg4SLVCyfmQebWwfL/A4wcOBg+KK8QLRIRw0P8x3V7fS44pewfqJ2NFHryrR5msjR559ltW2EjewKvhlhweqIN0mC0x9G+Ub891opZgAKnbqI8FBW1sBz9aMGxGLcjeoQp0K7+SgjtQalt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(83380400001)(86362001)(82960400001)(38100700002)(2906002)(8936002)(5660300002)(33716001)(41300700001)(6512007)(6666004)(6486002)(9686003)(4326008)(6506007)(66946007)(450100002)(478600001)(66556008)(8676002)(66476007)(316002)(186003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGtnSXhwbVFRQTZPYlNBQUhzbHJRaTI3YmlINXpjSllSeS8zN2tlc0hCOFRG?=
 =?utf-8?B?NzFkZXRuNUdDdCtGTEtma3doMFRiQmRwRU9tUEFOd1R0dlVkZTVENnZuZzcv?=
 =?utf-8?B?TEVMeXlaVE9SRk84MVZlSXJ2Vi9jc2dnME1hNGNCS3lDVVVYajA2MGZOdmdy?=
 =?utf-8?B?MFIxdTRlcFFhdVNyZmNqenFBMDNkMnVlRml0VEdzbWR6RW9uQnBIN1lPL24z?=
 =?utf-8?B?VWJsa0p5VEVMOWFVaG16aUZWMUxSbFV0K2lMRlM3K25UMEVRMVh3Q2taSVI0?=
 =?utf-8?B?U0VDTlRFRXRqemJCSHlvK2FrRExDUEN6MUdaTGw2VkF1VTdyM3Y2azlNaDl6?=
 =?utf-8?B?aVpjK25OSVFhd1FoN0NNQ1R5Q1dXK0tXNldZT3dlWXM0NmtqWmpFNlNtRUhw?=
 =?utf-8?B?OXI2YlYrYzk5MmszT2VHM0hRbmVhbTM0UU5DRVdlam5BWlQ4Mm9aZEk1OENF?=
 =?utf-8?B?V2wxRWxLNVUzakVid1ZKUzIrWUlhWEIzV2NzNUVSOStQLzNKWVVtUXJPWmxG?=
 =?utf-8?B?YTlzRXF0STZtT1B3djBQVC9nQnpqL2oxRm00YS9UeC90Nk1vMmp4eVdIbVQv?=
 =?utf-8?B?a1NxeUc4MlNmZ3lyL3hZUU54KzA5a1lxSk82NVFyUUNUZ2NvcGd5NURkaE9U?=
 =?utf-8?B?dmI1TjNNbHlaZ3BJNUVQWkZKSHU0WUxLQW4veGFNZk5JRlp3WVMrK093eVFW?=
 =?utf-8?B?VmI5aitHYXVkTmRSTHR6RHMwUHpUY08wcks1cWxXWWZqQ05VTVkxZ2xUbjZP?=
 =?utf-8?B?TGhSQ3F2KzhiOTFTbXM3RVBRTkh4bGhGWXZjelRSRzI4Qk54eVRLSldNRWpn?=
 =?utf-8?B?RW9QL0daVit3TGxacEtJZWlZcWpsUHRsUER0TXUxdjFkQmZGUVBhR0RGVjg3?=
 =?utf-8?B?Zi9lWmZtV0lXRlVkWDFQdHRsRnlDWnh2eWdsOFZ0dFUvY2pITnpHVHF2Nlhy?=
 =?utf-8?B?eHVqYmdlOWU5WjU4dS9DSEYyVm4za0E4NkVmQUxBQXRmNElqUXVUd1ZPOVhF?=
 =?utf-8?B?Mk9zWVdIODFJRU16WFNrSGo3VWR1eWJ3Z1JORGQrZEl3ZDZaWnRDSjhLdk5Z?=
 =?utf-8?B?NmtLdlFQcjF1dEhSRzVPZlZCVXYyWTlhbVNHd3QzWHNESjEvblpkdU14S0px?=
 =?utf-8?B?NzJ3ZnhYZ0VNS0RWWFZoS1JrSkJpQ3JlOGpUREtSNnJualdUVEFBYVp6b1BJ?=
 =?utf-8?B?SmVLYjI4ZlJmUEZtVEJTR1hla0gyS3BpM0ZnQUR0R1MvVnYrS0hJcTJRcjI5?=
 =?utf-8?B?SmV1R08reHRndUVDOW5zMzduUlpXQnErUnNvQWZjQm5VQTk2SEFwVVN2UExM?=
 =?utf-8?B?MzR0a0NoZ1dmK21ZVHBySWgwaDBKM0hucEJiRllEK2MwZHYvM1dlM0JTM3cw?=
 =?utf-8?B?aG8yUXdTang4eFd4ZGhrZXRyRGJjSTMzdzlMK3BOSVJrVHJsZUdmRStGVjFJ?=
 =?utf-8?B?TVBORncwKyt0akJnMmxaT1VCRVRPaUhHdGZWQ281TVk0bXpuWWR4elRVSWtI?=
 =?utf-8?B?djVFNmk3UlUvZFd2Zi9acENMV3c5dzYrSGQvcTk0MDBCYWtGWHBZNWNuREN2?=
 =?utf-8?B?UGlrRys4aERndEYvc0xncFJIVmd2dmY2bUdiOVBEQnpDTjdVUGZYalBmZkFo?=
 =?utf-8?B?OTJOem9qaDJYVnREcjdpK1ZUM2FhR1BlZURPZW83SjBMbkE1Z25iK1pUa2xl?=
 =?utf-8?B?Ly85Y1JWL2NJellmNVY4WFdtZlFGa2NobzF2ZnZZaWxFZ3RucDA4eUdrOHBV?=
 =?utf-8?B?SU1jeVJXNWRERmVXUVlLdU5mSWhuSzVZZnBkSTh6bjAxcWd4TUtxVitKTnRE?=
 =?utf-8?B?WHRuU2pxLzFjN2t3UHVlQWZYZzBLNXJ6STVvRkdVeWgvQVBnRmorYTR0SEJy?=
 =?utf-8?B?UXVxWmZkU0lKOGp5SGx0SkUvQ3R2dmVWSDQrTGw2OElYcHF2SkRFS3lEY1Q2?=
 =?utf-8?B?VkVUdlJaZDNTQTYwRUEyOVdYQmhmdWY3dm1DVUZrUG83cGR0aS9qZE0zRWJr?=
 =?utf-8?B?UTlDOU43Sm91OTQ4NzNGQUx0TU5ZRjhDNGlrODhHeEhvaWRDV1lsdHlxMTh0?=
 =?utf-8?B?dTJGTVFEL2ttSE9QeGc3RG4wSFhvZmtMcklSek9pLyttNERrSVRIWUZFSlBF?=
 =?utf-8?B?T2VRNDVqYlZBZ1N6S3hvVDhEMkcwdENsTTkrYmFGTU9OdCtPQUZST29mZFFl?=
 =?utf-8?Q?lnm3/1DtdCLd21hI6M6QBV4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d313f7ca-e524-4b35-ce8b-08daddf4d1af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 17:01:19.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZuuX8WV1cV538D/qkq8YdwkYOaptufRkmNnPslJwh5H7NYyMr/OxhzwrdoRIx5qbJQd09mE+bvpUYxB+uwBbsk1IF558g0JEFY/EDuHBBEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 13, 2022 at 03:41:19PM -0800, Matt Roper wrote:
> Programming of the ENABLE_PREFETCH_INTO_IC bit originally showed up in
> both the general DG2 tuning guide (applicable to all DG2
> variants/steppings) and under Wa_22012654132 (applicable only to
> specific steppings).  It has now been removed from the tuning guide, and
> the guidance is to only program it in the specific steppings associated
> with the workaround.
> 
> Bspec: 68331
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 27 ++++++++++-----------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 7d71f5bbddc8..bf84efb3f15f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2913,20 +2913,6 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
>  	if (IS_DG2(i915)) {
>  		wa_mcr_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
>  		wa_mcr_write_clr_set(wal, RT_CTRL, STACKID_CTRL, STACKID_CTRL_512);
> -
> -		/*
> -		 * This is also listed as Wa_22012654132 for certain DG2
> -		 * steppings, but the tuning setting programming is a superset
> -		 * since it applies to all DG2 variants and steppings.
> -		 *
> -		 * Note that register 0xE420 is write-only and cannot be read
> -		 * back for verification on DG2 (due to Wa_14012342262), so
> -		 * we need to explicitly skip the readback.
> -		 */
> -		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
> -			   _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> -			   0 /* write-only, so skip validation */,
> -			   true);
>  	}
>  
>  	/*
> @@ -3022,6 +3008,19 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
>  		/* Wa_18017747507:dg2 */
>  		wa_masked_en(wal, VFG_PREEMPTION_CHICKEN, POLYGON_TRIFAN_LINELOOP_DISABLE);
>  	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_C0) || IS_DG2_G11(i915))
> +		/*
> +		 * Wa_22012654132
> +		 *
> +		 * Note that register 0xE420 is write-only and cannot be read
> +		 * back for verification on DG2 (due to Wa_14012342262), so
> +		 * we need to explicitly skip the readback.
> +		 */
> +		wa_mcr_add(wal, GEN10_CACHE_MODE_SS, 0,
> +			   _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> +			   0 /* write-only, so skip validation */,
> +			   true);
>  }
>  
>  static void
> -- 
> 2.38.1
> 
