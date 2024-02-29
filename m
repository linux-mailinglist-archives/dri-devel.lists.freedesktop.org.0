Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C808786C6F4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C4310E41D;
	Thu, 29 Feb 2024 10:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZzGpOgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF84B10E41D;
 Thu, 29 Feb 2024 10:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709202664; x=1740738664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H1Rse/l7Zjk8seGafyVn0oW1TbyvE1YLOYtnH+FfAMk=;
 b=HZzGpOgHOtZgAmysb3SDKUwyyng+ZLXBJ7EM7iBfwpdh6fVA9sNzYUd3
 Lxdek9QhqGrvZqbt2Y44umlXl5qKmt5CXCOgHk4WWVz2IRS10St2nmtOC
 cxbrlJj5lOImlMdJkpKsHA30ZH+5C6KA98s7jruKpNjr2SHKpZb6WkgtL
 S76+hiD89DD9Hfi3myS2MMJqmnB4cL//KLOYShAQPzT+PedsaXZPI9tb7
 vheCrc81I8iENjPaRvjRVEiDHBw5D9DlspPvLgzy8nL3X+rWbq8ozwyXk
 yl1d8CHjahuNFLuM21tp3eiZbnOdikrnSXO6vRtt7RXTKpayrIPzMUcZe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14813915"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14813915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7650013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 02:30:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:30:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:30:26 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 02:30:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 02:30:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpGLlAkXKIKLMxwhdIPX44tDCgzAnBfFS/NHTAts9/PkSvpMTI4EpyNs9C13hy9PTDhL1UnA2M11GNuFGyXLbvoSPAciffrM9c8YzE0LQ6gfpgz4Ky4I4YkSLPBbGYoY8LCI4D7FJ9ycoEAMTL6Uxwe4kmu1vREqzN6GYCLsolnJU/tmwMNeuMrKx1PyO/TzG1r+JVS4st4Ixwvz4/oHP+3DEyAuxZTWJH+8NNlQJH+S6YsiISODbwei2yvCPoiSw1VDe4zAksj+gCehn8E6o9/sdN7k8J4v8Qtl4c/lEHLoSQB9mEbSLGZoKIN+gcY9mhUthfSZzpsr3LKxu4VbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ffTGTj5PYr5THfPxkTOfug0smV+N1vc8LnYoZ1bm80=;
 b=iyomuIK3Bg+w/yfLu7qa3fQ70JA8V6pzvln2C/tdwCDSqB0io5dEUKuPv44AkG5eF4mOIuAc5IviB9+3wvX8GDHFaeM+Jee0dDUU7aLOiTj++3hu1+ZNaQRKElR8fR4I1145+XXAhngZdCAZuwerGcax4zyUlag7+DICLDZBgJqFj1g3+E9oSk1TACQMP2gHzilpHsmDd0sT1whr8gcEGb1U1P+tP3V2a8aQme3LzBy6yLAV6isXzz5OBaBgtukNMGqz8Cw+ejaIWbcBkqOl/Xr7NPX90gPMCrOJy+yET/b2V0osBcLf9JiRGW5eP2E/+zIarG6LRWcPWj8l8H5Pkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB7194.namprd11.prod.outlook.com (2603:10b6:930:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 29 Feb
 2024 10:30:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 10:30:25 +0000
Message-ID: <e3dbd6fb-c93b-42e8-8e75-6b6ca4973f1d@intel.com>
Date: Thu, 29 Feb 2024 16:00:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/8] drm/i915/display/dp: Add wrapper function to
 check AS SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-5-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 53217612-6b12-4a30-c9e0-08dc391170a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bPLVvF8Wd83oA2WJr7ze0IRzL3VIMrgyX10RYot9iPmzALzX3Cmj/TpruV2cPQ00NyAPo00gZWfLrIxNxMCrEBp6KtMGuZI72pS2yIs7g7S0gRsE5L273gveV6gfrILa6IbrooQZWkwkiIp4M+KD5n7bJPtl/41iwTeMh9LHsK8OXwfFpSW6IKgQFddZDt8IV+oaaF2sZO8u3D9DlC+j3ECo/27mBMMrPJMGTTSZLiHz7Ava5lZa25tPieT5cibSOLyB0j3uzky681eUWe2yB9LKkY44cedHmOXnG5GwwS4RIZJo1EDd8TzjuCueN1Fvpx7XMf8tCau18SXb8ao6nWpiEclYz5ukChtTPC1UpNZLWoZPnzHa/YI5VFIpMUa9EWLpAT8cIBFi7Tf90PhpizsvYPuUi7Q83DqBIl9+x5FJfbydbVaLcqvZ3PCl7AEgEVL9R1GZX6hq1nI+ZHj2xwMRMersR1QjPy95Ii5757PnNCK/W3Dd7602NmnV8MB5Jtig2Cf0litPbSBFCGCyNq+5pDAO8iZOdNr/Ne4Cgqh+MJootqEGxB6v16uacggxxf+5+OVKIab6hEWh8w0eqdxCWP0mujDM12hHR8qvg9u9tDVIspD7vf+c+0naEQzl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhvcHFVVW9Fd3RaZFdnNXBYV1ZFcThoRlo5eTN6akN6ZmZicGlQaSsya3R6?=
 =?utf-8?B?UmN2R3I5SEkvZlhhUXNkUVJ4cXE4ZXNWeitvQmk1Z01UbURlT2dkUW5MVnBD?=
 =?utf-8?B?bGZBRUtwWUlSSUJvSWd4NVliVkZVcjExZG03ZWMwL2xXbXNMZktJbC9HQ3RN?=
 =?utf-8?B?bTVVQUF5YVYwNURZSDdTQzY2MzVhSlFLbjVvMUEvL2I0WEVzeTdMemZobnhJ?=
 =?utf-8?B?NDdDRE1SY01DcUVhMktodURDM1ViaVZjRlFkbGZpNVhFOHlpSG9mdWpQRGdi?=
 =?utf-8?B?SDVvc2JJYUxiTm9nT2JqZmFxTUp1VmVzY3FLYVlqdVBWNXdiempLbk9rQk1J?=
 =?utf-8?B?NWFTR1pBTE43UUs3Z2hSQ0FyZEFtZFFuZmpwWXRDcnQ3VmR0dTByRElwWFVK?=
 =?utf-8?B?b29HejA3Q3ZhR1RkdEpvVkxTcmd5TVZ6MTRlUUZXVmhGakJIY21kSTcvTklw?=
 =?utf-8?B?a3prY2xJREswNW1nWU1KejdybFErZkhXMEVvd1lKRTEvaHQ1d1lWNzdhZVZ0?=
 =?utf-8?B?Z1Uza21rMEY1SnFTeDBHSjJ1Y2srMlh6VjFRcWp3RmtlRlRLTU8vSjY0UVdi?=
 =?utf-8?B?My9zQ1FKZlBEWHRkN3BDRGt2REZGb1JvOVExV2pqd1lpbHNKeWsrZEtteWh6?=
 =?utf-8?B?bzlFTmVTaUEyU0FmMDIwM3J0M3JzZjdYNFQzWnZCeDlSWGx5emZEWWVmazVs?=
 =?utf-8?B?QVhRWkZRaWk0MElHQ3BkSDgzdWU1REdvQzNENW9RYTVTaVhwR1Z1L3YwWXp1?=
 =?utf-8?B?djNNT0QxbnJZTjNWUCswUW00YzBKUzU0WVdzME8rQnRhQmJnVTZoNFVUdWVZ?=
 =?utf-8?B?RW91RE11KzlrSXZSeDFvcCtRVUEwRjBsZCtFVkhnT1Fja0tJWmd1RXBiaFNy?=
 =?utf-8?B?RGlGYVkrYk9OR3lISTRLeHlXQUdXRkEybUNaQUY0TzJ5OXdhcU9CRWZVYjc2?=
 =?utf-8?B?SG9LTVcrditVUGVWVVJHYUhXN0dxU1ljUUF1UVZjcjN0aDJpVjh3WFpsc0d6?=
 =?utf-8?B?THhCWjR3YUtadkk5MWJuYXJha01CbTl1bW52MVQrUEU4SDl3M0h1c1liN3g3?=
 =?utf-8?B?TTRMWFVmZlZyaVEwYVl6eWw2U2pBRWgxMVZnS283VGFGVG5yT0poNnRkb3Jv?=
 =?utf-8?B?eDBnYkkwWnY5RW1wSGRGSXROODk3My9ZbDJJMmsydnhFRUtSL0ZLb0pUZklV?=
 =?utf-8?B?V3FhZ3NDZ1VobGVaclF1UVFySjlHODN5RUNSS3QwRUdVTE11N243WHJLUWR1?=
 =?utf-8?B?MkRLOVp4RmhrVisycXNHRGQxTWcyNnU5YVlsR1B2dmNlNXViMGxWZThWenNS?=
 =?utf-8?B?aVhqc2hDWE5EL1JWMUN6UFFtVi9mbWpQU1REWDlRVnlWUGszR3Vmb1VrQWd3?=
 =?utf-8?B?eHdPeXBseEdJd2lENy9PdHFXaWVJenA3dzh6bndITXcrN09tVmp4MEx6UThK?=
 =?utf-8?B?aDBlMXl5aS9DTnZheldpTDc1M1dOVDMxM0djMkF0aGRDTzg3UmNvTWZKY2dU?=
 =?utf-8?B?Ui84NXBlUjNhbWRYMC9lZzdlYW40aEllWHlRQXFRTStHWEhIKzA4ekRuK2Ez?=
 =?utf-8?B?RDNWTHlIY2NKUVJEMXc2S2s0M0tlMlB3VlllMXpTLzA0OFV4eXNpUmVDNGtw?=
 =?utf-8?B?b25ZN2dhczZ6Z0VndzdBMERIcnZ4RlRCVEYvK2NqS0d6MGZMa1JEWnEraUhP?=
 =?utf-8?B?aDNxYkhkNk1hKzNjeFcrd2ZUa3NDcFRFa3BidEJLTW1yM21FRFIvMkdIdUxy?=
 =?utf-8?B?cFhJcE5KS2ZJZ0w2TjYyOTZsUk9HWGlqNlFQK3NKRFk4T2VsbnhaK3BSMGZS?=
 =?utf-8?B?OGc4d2ZZdGFRNlp1U1VoUjRpS0pjVjdLb2J2Q3RZbTJzTCtGOWhkd2x5aWta?=
 =?utf-8?B?aFd4azRSbG5ZNU5CRHMrL0lKS0o5dHU2Q3NHNW8zZzBLVjc3TFRVVTQxN0xS?=
 =?utf-8?B?V2hZYUtPLzFkL1NYbDFmbmVwY1R5V3pUbDdCcEFoWk5GWnVqeEZzMGo5NXo1?=
 =?utf-8?B?MW9RRW8waHhqOXI2SlJaQmtmMGlUbDB0aFNjOTFQUktBNFlGQVpEMDZYVHhE?=
 =?utf-8?B?UW1XOUNhM3dWcGg4Vmo5TnphQy9EbXp6OUVTTFFKME9HV1VxQTlVbytwU2tC?=
 =?utf-8?B?OWd2cHoyNmE1RjRYT0wrREZFZU96L1ZJc29zOUs5bUtabW5Xajg5UzRvZElx?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53217612-6b12-4a30-c9e0-08dc391170a5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:30:25.0185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSp51jpCuKogucmn1xdkt1/uDE/b7vKQdCzWM7eD6oM50mkzFiux6fFuF8m9svTNY5QpgImj7kOPbKtqByGe28zJuUUrLq7xAIRtYSWIPEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7194
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


On 2/28/2024 8:08 PM, Mitul Golani wrote:
> Add a wrapper function to check if both the source and
> sink support Adaptive Sync SDP.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Just use drm/i915/dp in subject line


Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
>   drivers/gpu/drm/i915/display/intel_dp.c             | 8 ++++++++
>   drivers/gpu/drm/i915/display/intel_dp.h             | 1 +
>   3 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index fe4268813786..6399fbc6c738 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -68,6 +68,7 @@ struct drm_printer;
>   #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
>   					  BIT(trans)) != 0)
>   #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
> +#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
>   #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
>   #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index e5377cdc71c6..7eb83924f3fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -120,6 +120,14 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>   	return dig_port->base.type == INTEL_OUTPUT_EDP;
>   }
>   
> +bool intel_dp_as_sdp_supported(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	return HAS_AS_SDP(i915) &&
> +		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);
> +}
> +
>   static void intel_dp_unset_edid(struct intel_dp *intel_dp);
>   
>   /* Is link rate UHBR and thus 128b/132b? */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 530cc97bc42f..cc5e069091ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -80,6 +80,7 @@ void intel_dp_audio_compute_config(struct intel_encoder *encoder,
>   				   struct drm_connector_state *conn_state);
>   bool intel_dp_has_hdmi_sink(struct intel_dp *intel_dp);
>   bool intel_dp_is_edp(struct intel_dp *intel_dp);
> +bool intel_dp_as_sdp_supported(struct intel_dp *intel_dp);
>   bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
>   int intel_dp_link_symbol_size(int rate);
>   int intel_dp_link_symbol_clock(int rate);
