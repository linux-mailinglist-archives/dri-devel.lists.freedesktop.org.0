Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6966C86C63D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD2810E3AA;
	Thu, 29 Feb 2024 10:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKi84WXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891AC10E371;
 Thu, 29 Feb 2024 10:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709200905; x=1740736905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6qWvfwDvG8oo7zaGmSU2zfu02tvNkKOhIRaOK1BVL2I=;
 b=QKi84WXPeu2rGO36EhGUedy40788WDuwzr7TVvNNQEjpkiEIKVAmQuuU
 dE0fGpJ/NrSv4VzjjnNR1mmPy0PzINnVhqblbdIv46M7PTdU5FbIG+Hdj
 kTNWMx0cgk+DGqRYmPOvnqRMXiL6W0ttiqH40uhaTmLMrBa0tcH84+QPI
 M/SbWLCXUOYf1pvW2hX6qyYUZJkdGgm8lGt1JOCzfbXvwFypLvBbdJ//6
 rF8IHiTtWm4s0dY+64zS2Uk5FZyU46PFuqRSmaqFGAtBs0CydhJ4kx/sA
 T9vR4Z6cJb9YwIBirUE9a81SNrfQlYXogfSOAPDatuQHUmV3MqEer6Ha+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14296130"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14296130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 02:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7813082"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 02:01:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 02:01:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 02:01:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 02:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7ZFrQ9EJTYZinh7w5abGj+1IK1Z+jPGodL5tYC7WObGkmYH3mIcWXHVZ+SZT3g2105NGsgOmhGuCcrjkFdJLX9aaCCKOI4+Fh2VTVDcF3oRE6PvHk9BN6n5rkcsHPFUNU8s9zbBNZkYu6kb0WU01hgI36bb1rFnhFrXuV0hH6oBpywGAUa9FYpKVz1Qn3uvL5e3kHxlhRNaHIHYr7Kd8lb0JnKzYEdldyVCQZyL1O6Dfavmgk4NkSUwkX0st3BcNaiRqags9k7kMFasHDxJtAShcmGzw6yx3GeCGhXW6Wf9HQSvfUHX37sUZjjcW94ShoCov90lY5nz+gXLBfUs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTULSxwe9EpDcrM/gmXPRfhv9jP898gbf4gChGXGnpk=;
 b=nEwN8B2AmZJh9llgtCp83KC9gFia9hOjGTmZQESGyNq99epMgkyauBvixLzVozhc41sYqRfuhTWC4wp1Z+D9Q6tKBXF3nzBxQ4UJVt3EQVoN09Nw1hfT956lobahONHicNY0yLHexxeJ6+KXMSpdKaOCmlK3SfvkGfHYaE1HBSllGvKbysLqQUi4oe6iQKIEWTQwrMm3iSSi5SwUhR+67UFd9heWmxUei9iyaQ4XanZniqjVOJeRGXWKwlpcZTzEDsbcoS/8gS0U2spj6Hk/qfVlkA1TQMg7AbMcAHksaCTYVjRJMR1VVEGsTSOEl8kdhsh1wirER85I08kh6pTsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7320.namprd11.prod.outlook.com (2603:10b6:208:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.15; Thu, 29 Feb
 2024 10:01:40 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 10:01:40 +0000
Message-ID: <199a60f8-37de-4aaf-8eb2-cc94f5212a79@intel.com>
Date: Thu, 29 Feb 2024 15:31:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/8] drm/dp: Add support to indicate if sink supports
 AS SDP
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4f54c8-cc5c-4dca-14fa-08dc390d6caa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wKeAz37R571Y0WJd9bGbywbM3u+wbtfJyAf2mNeCjwADYxC05dKqYI1NnSTIdSlp4rSiujPwa9QevKMzX+oaHCBs/aEGTGCIP2sU/snONt5ay07ceE59hwwRZ0F3LA0Qg15EuGSQ+XlvFyeQKDLaKzgOves/2dHsFT0C1D9pqM8vdN+aE1MQoOZolSKb52L2hnCkIZuJ4b6PanHkaAXq8rIqII3LF3mw4m0xNDCywIIY+9UwkGuYYqFQjqBZoc2aUEGq0PDdgPAeQVKd3KSL8SJHF0wBq98oL585trZr0j/+lyBOwcpBhA/1Uofe2WmOdXPCkg26ZhQDgsyT9s+LWwfqFB4ib3L7u6/btujSemW/SeUCtQbT1lnZq/Iz/Yph07TrGz6TyxRYyQdBCCNfEqysXD2KmTVuzTLFMiFj3A7fNB6UyUxZS8AjAFaSmcTXJaV0tShRIjWZobx6B6tE4wng9aLFRZulYl1yKCRNz/lfe4OfoeqrJS5fTx/v/6YbiEeu4UvBvHY/oqq3KmHpg31ffNqK/jYnXVXZ9GMirLMlfBo8p30e6VQK6XM10kh5xuz2iYguiXlPwSbBaR1gsWpXDpEDAKeQbHqbXyCGCM+bD7FJgsgxYPlCkRSBfiwDAGDgkl0pBq3l0TvquWD8ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5nQ3BTdDlBN0t4V0FxUmVsbHN4WHZpZG5GTFdydjVkTDk5Ly9uOFY4MVUz?=
 =?utf-8?B?bytlTzU5N3JVRmo1RUtSaWtWYjVFdVdKNGQ2N2tVUGpLajBVN1RnUlhzU3Fo?=
 =?utf-8?B?RUNXSmpjYVNJNW5UQlRFRm55bnRqenlyRHBnbVFRTG96QURMSCtoUWh1UENt?=
 =?utf-8?B?NkFlUHRDOHQ1ZG5ueWFPNlZpdHd1bXRiNFZ5alFaaE92MDJRbjRVckNxT2l3?=
 =?utf-8?B?NkdFTm1XeU5USnEwbEhaTGZRdjA3UXFQZk1YUk1CQVFML0xncE1YbWNXY2Q3?=
 =?utf-8?B?OUdmbmE3eGM0cGx1aldITC9mclhLY0tzUGJ2WjFZUGNYbDJPa2xRZHVkRkFy?=
 =?utf-8?B?YjIwQU1IZjhJS2s5S3dFUW43c2JmL1FUOTd5RmplckU5bVR6Z1ZvZ2RhQlFi?=
 =?utf-8?B?bjE0dThsYVBMTXRuaUFCcEdGWjlYK1BQSmh6SUlkOG1QREdBbWRJRmMzZXQ0?=
 =?utf-8?B?K2IwNWtMY0FJTEZjQ3pqcGc4c0FCMEZ3VnByc3FEY1RwRzk3SjVtaFUyck5L?=
 =?utf-8?B?eUdCV1ZPOC82ZndGZHNDT1R5YnhQMm9MMDJoSWt3T2VWczFiamxwMkc1aktk?=
 =?utf-8?B?em1oYTVVWEZnNjlCRklBakV3MFh0NHZPRWM2cUh5MGpRSWt6Ty9RWXRmQ3Nt?=
 =?utf-8?B?VlJBTXVyRjF2KzNLdG16RVcya2RkR01QRmE3VlB0cndOYUNnd1N2eUJnWFRv?=
 =?utf-8?B?M2R1bTVKUmQ2Q3dNaDlsRWlZc1BtUXNrbXRveGJjM2hYbHJObTZFOVRtT2FQ?=
 =?utf-8?B?M29BcUNIdnk0djhXZys0Ky9TaGFPYnN1V2tIYnh6eGsydXlBd3QxaDJJWk1R?=
 =?utf-8?B?S3VFL1dxaEVpY0lEYmkrbXV2VjVnUld1QjhmVnNuU3pISmcwN01ZbDFBZU9q?=
 =?utf-8?B?Uit4S2loa3ZUL0twaTIya1dnY2FYVy9PZjNkbjlDeUNpRXo5aWlrKzZNN244?=
 =?utf-8?B?VkE3U2crQWJLOUhXbGVNTXpHbHRRcEJQSzg1QlByaVdyMVNDa2hPSFRRL2Zh?=
 =?utf-8?B?R3Z2TmZQVnpyNkZXM0U4L2IzclVjTjhnMHBmWlE3OXEzS3kxa0hlbVViUEw3?=
 =?utf-8?B?YjhYaWcvaTdJYVVPd0Y2bHo0Y055Tm9xRUlFMDFvenI4ZmdCd3k3SFk3UlNX?=
 =?utf-8?B?Y21id2VWYnQxWWo4L04yTHgrdkRPb0FkNmszTy9ObDA0aEhCYkJ2Sis4SkRm?=
 =?utf-8?B?a0FpL1dMcmQ4b1BXQ29HZzBsNXQ5R21TY2NuTWd0THJYakhTSklnSk1pQys4?=
 =?utf-8?B?dnl4MmJpUzBuUzU4dEd4bFY5Mmd2NlA2M2h4RzlxUjZ2dDVvc2xONDhJOHls?=
 =?utf-8?B?MVM3Z0hCNjRqSklJZTJDSHQ5R2s1SHZ3NFkycXA0dUhRSWNjREtkRjBrTFNn?=
 =?utf-8?B?cFVnUFBrWXhQelN6aEFUTEFpNHBacU1MMW5NN210dHlkNVVobFY3d2hia3U4?=
 =?utf-8?B?cjg0SkZZTEhvTmlRcVRtUURWTjJVN3Y5alozdDN2MGtseU1iNmtPbEdoZFd3?=
 =?utf-8?B?NUV6bHk1SFg5Uk1XeHVlZjVCdXZ1dGNKQzhwd1dsZFZpelZBVVI4VUxtNTkz?=
 =?utf-8?B?bzdrYkM2TnRZdkVia3lSRHYyM0pHOHJlV2FIR1MwNSsvMzViQXc5clAvV01v?=
 =?utf-8?B?V2VYbnRyeU1PeTV5c3BEOHFLS2xNd25Hd1FLWFZPQ0JTeFRKUmlMSVhNME9u?=
 =?utf-8?B?OUVXbGNUTk1hcXU3NzVSNEk5NzZBcUMyY0E2YmNyem1ueTdUdlBxMlVSNG84?=
 =?utf-8?B?QjhXUko3bzRGU3QrV0EvR2tSWVVGL0pRMU1ldlJ5SFltQmdEYWZKbXYxNW1Q?=
 =?utf-8?B?T3pGQXNiREhYZ1djTTVyQ09YWEM2dmtmbE1ReXFqbjIxTXhDRnJ2ZjI1Vzdv?=
 =?utf-8?B?VFIxZUFFVWw0OE56c2RhNHMxaGhkWlRFRkFLZ09WeXZ2VXdMek9wNEZNblVl?=
 =?utf-8?B?NHVqbHQ4Nm84Zy8vN0RpV0MzMzZnMmcyU3BFcnp5MUtZSVNVSWtZVTVKaHNl?=
 =?utf-8?B?WUdzb1Mya2d5d2lpSWNndTRVb0t5OUlVSXU1LzJkbkJYYkNqdGpuWVZLRWpl?=
 =?utf-8?B?bE82Uk15bVpsakJhaVl2MHlOTkdTNTA5ak5xQU84K05jMUxDQVpiV1FrMzlG?=
 =?utf-8?B?NGN1ZUpUNFdBcUFhWGtuMTl5R1ZYc09pc05vbm1HM0plTUwyMkUrYkQ1cmNV?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4f54c8-cc5c-4dca-14fa-08dc390d6caa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 10:01:40.4175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Idb8XicbzosI7EK1yUTokTB3ulrWmcDMu/XQvW1s4Dx/eEWT/4jD4NCNzm1SMPAHFnxZEprWOX0GqtYWEJYJ4ToyfXuN9PlK9bc6zcaUiUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7320
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
> Add an API that indicates support for Adaptive Sync SDP in
> the sink, which can be utilized by the rest of the DP programming.
>
> --v1:
> - Format commit message properly.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 25 +++++++++++++++++++++++++
>   include/drm/display/drm_dp_helper.h     |  1 +
>   2 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 9ac52cf5d4d8..f94c04db7187 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2913,6 +2913,31 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>   }
>   EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   
> +/**
> + * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if adaptive sync sdp is supported, else returns false
> + */
> +bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	u8 rx_feature;
> +
> +	if (dpcd[DP_DPCD_REV] < DP_DPCD_REV_13)
> +		return false;
> +
> +	if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1,
> +			      &rx_feature) != 1) {
> +		drm_dbg_dp(aux->drm_dev,
> +			   "Failed to read DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1\n");
> +		return false;
> +	}
> +
> +	return (rx_feature & DP_ADAPTIVE_SYNC_SDP_SUPPORTED);
> +}
> +EXPORT_SYMBOL(drm_dp_as_sdp_supported);
> +
>   /**
>    * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
>    * @aux: DisplayPort AUX channel
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 0c1a4021e098..7c1aa3a703c8 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -101,6 +101,7 @@ struct drm_dp_vsc_sdp {
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>   
>   int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>   
