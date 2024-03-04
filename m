Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01C86FC36
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA2310FE6F;
	Mon,  4 Mar 2024 08:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQ4MmCuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0F010FE6F;
 Mon,  4 Mar 2024 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709542080; x=1741078080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vdc0E1TBnh6JY2vUFTC11oYFcyUgM4hqVAsa3C/O1yM=;
 b=KQ4MmCucevWDE+BrOgRT04eIuwGWkhgdoO3wYJQnP1Q+c2gunj27lW+u
 3+7UD81jB2+zjDTKx9YHZMbn/F520W+uCdj2QDruAunSYtvplvmqvntKS
 B9xXK7werwsMu96dsLp7kyJSyD+8XXOzFJqPls6ev/xrBIYKVZ65zAjJi
 P2x2pefx6t9o7mfmNUv/zzSCIWs2gc7vEXDMH/v9qM3ZkHVey8WxHNdtM
 xDP0VbkJpmJKq7JZ7i+mKwxUoDxh9X7/AKVN3HOoZlmWA5jTqhepykXp9
 RFlf2oElsEJ6ZdMTJPExPW9rorhsbsTN0nsPHyZI039umOEPId+1FqG2w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14601073"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14601073"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 00:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13425453"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 00:47:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 00:47:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 00:47:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 00:47:57 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 00:47:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gh05Co9YZ5VaDFwDiV7H5zrs5Ew5t4pnGvT/h17iMdOOqbbukJMjqdu+zwz/kdLNOOypI8EciDnDc/2BHmj7iYVeBesJtIZqHEH74gjHVK3XRsNSN9wS378vkZObVMaMwNuRIPmo9Qq6TLTqjvZIIfCcASKYfBLirCxYC6uPNfDlJ4TU3Tx87Dfh9UFQ92ChNy7Aqs8tXaSR1/NXi2eVT4ylqleAgRmUqbuKehalqx9+RyTOGgWO1HKWNRXhaefLD8cP5vfmYB9NQVK2KBuwQA/dY/7jMrt5/giFsBs+Sl8uOb2S/4tPDe6KSFvcecsSMBwDapea/vfZuopvxWVHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcXakxxaxNmClVzOw3Oqf9ubOk7y9euLTZ7C9CrpRfU=;
 b=WQTeKj6lmcGzNaOT1vRMflrkiVyq2y2aaKPVi1t5wv+4YYfzGKWan4ajHmIR8YMMfnXJPEHXsdqm+y5ZMKinf+6JQldiG5Lvh6ge6Dv6cC4nvSXRHbvuLKJ7D8eQoMQbZsFa7Plz1DpdSv73yZDfHh1ZK8WeDuxnOw8mDQ8X7ROHbfVsygFf1PZ/a8OtDKk2i9MPB4h4ld73kbVcdlUC0q2LlXBeciz6AHOCx1LSDf6sMTeeBlMngF1viCJbGvTmV7+N+XlAGM9YZzc31W8jxcabmLYo7EvkefySGYrkmDi3lGUsKbxTA290DTuBVVozeT/VP+KTEUbmJNLD9s4agQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 08:47:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 08:47:48 +0000
Message-ID: <b665d533-a62c-4617-9c7c-1d2d43367eb9@intel.com>
Date: Mon, 4 Mar 2024 14:17:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/9] drm: Add Adaptive Sync SDP logging
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-3-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e01137-8389-4792-f5aa-08dc3c27c4d8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XGy0cHv+tuFEaj3N4yBT3e100oaWtdTU4rPeUqXaHgsIQUcAtU91+MJ19BfgdMHX/vRswc3zH19jyrtx4ShanADGIXmASsk42CFPk/uh3aFVn6AY7p8rgLlqTxIXanz3VfjIz6rcbqvZVOZzocNHcFWe8yMqSj/IIHPHyX14QCBWXhhAC0I86YXaahXdU7bbvynV5CFY9O75n/UOS6jjQgzyBUR3JuyDmpt6bvgBr6x7ElH+oJS2NHlTh8AgGQcOw5/gAfKcuy/0miYgOJhaYa5t+cVvAUXVhD8uTdUpPlRT7K6V/68kBTN/jQ+WohszOnHFYpbkJNJT5n418/MRJSdQax+AuMPtPamegDgGpqrq9cDWzNk8Gilzv7Uc9ei+A9T6HU7g0Oq2UlL3b6u4gDGsAw7TymcaYfX8egtfZJeCxwyrC/dAUEAYk5nIMu39w6si+d1PhY14ujuQsYLuCle8FljTJRSDYtmhFW2FZeNrQ8FagTCvQpGws5NnX8ccsJ7OQZ2GIfGFsg2Q68Bx4hBpCUwcB2LTlqdBVtrR1Bnpd0JicXXx6jKmr2ypWyenNvRhI2mPic+MCHGZlfxh4zgdeovTBl4DDqW28kO9A1ADOSYU7GYepgO2Ck/IpUHdXPDEtLAQdYn/b7MQsKHazB4l/d7U2ZRPEl6Lnhd4vcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEJHVXpPb3dYVEEydHRrbWV2OWdEUDk2NWZxTHVFMXZTMU1zdXhheXhZTEhz?=
 =?utf-8?B?SlA2cVUxUU1oczEzN3FXUGNsTXlVczFrODRKOVd3YlV2eWI4K0tOUmgxV3cx?=
 =?utf-8?B?YXlBbFRDbmRtN3ZzR082Q01oOVNMUTJWVUt1NVVhSFZHcXdqVFNGT2dHeFc1?=
 =?utf-8?B?Wjl0dkhLY2g0clpETkVyQjNiRUZEbXZ3WEVBVkF3WkFzNGhpcXExYzRpY1Zz?=
 =?utf-8?B?NU1zMFN1RUZSaCtyWmJUdElqbFVycnZscEVCWFlsZ3FIa0YzdnRkOElwWHor?=
 =?utf-8?B?Z25tQ1Y4VmZSUmVvMWVDTG5jOXg4WFozcnhkdGV6Qmg3WUlydjdlSmVMZzl6?=
 =?utf-8?B?S2ZqL3ZkZi9lWjNxWVNxOXBINHdHTXE3M01kZnF5MmpsUExKU3VBN2NkSGFJ?=
 =?utf-8?B?Y0hlZSt1OHZCSmgzY0phS2ZVS1ppdzNiK2luYktPM0FLMXoxWm1WZFRFNlJO?=
 =?utf-8?B?RWZ5VmNVMVJudUZWeS9VTjhXaUlrT2swVjliaXpaTTFINFJVNHRrS1N6S2Ro?=
 =?utf-8?B?WXp2Q2pqVmZsT2l3Yjc4eHM3TE5TZEQ2QXBxejhxeElOTGg0SEpOQTFHeHI5?=
 =?utf-8?B?ZXFvbXFkWFh3dUVWc1N4Z2hXdXB4NTFhamJKQTk1QnI4SVZIYkdRczRFTlpM?=
 =?utf-8?B?dFovc0JBaFhFMzMvc0tHYVBJeDIzZlIzZndVNTJrdlh5K0xPQkRKK0l1enI5?=
 =?utf-8?B?VG1oRE5zRkh1R3VLMnFmTmJFT1ZZbDFKNmRKdW1ja3IyNlRDd1V5K2hFVVMw?=
 =?utf-8?B?aE9UbVpsZUVHQW9IMDNhbDB3elMxMlRGNVRFWSszcXgwb1BhekZPYjh2NDJi?=
 =?utf-8?B?Z2hRQVJtY2NJaFZ3cDVjc2oyV2xQNEM2bjRPY2pzM204QWYvbW1NZWl5MGRm?=
 =?utf-8?B?Q01OdkVYcDhCZVdqUS9ZT1k5MGNyRmIzeXplU1dFbCtSaDVnUldNNytVeDVB?=
 =?utf-8?B?WUFTZHhBYjM2SHRpbjRrV3luK2YvQlpZb2tKelh0bk53bWlCL3QxQzdmM2ov?=
 =?utf-8?B?b1Vhb0s4ejZWN1pETTVHRXBqbkZBV2hkYkdmYUJoTXlmbDVMWUQrNWh1ODB4?=
 =?utf-8?B?NzJ1UU5BTGFRSTI1THBWcmlhNWVYRWsxZUhwWjMya1FHVGtvaWUwMjNoTmtr?=
 =?utf-8?B?THVzeDcrSTBUQkxQTlljalU4TWVMcGZMeHNsTS9Kc2p4U0RCR0wrdjdONWE2?=
 =?utf-8?B?K3V2UVEzYUhJYjAzWTZ3WUJWaUN1ajliQUJONTc5YnE3c2xnd3JoclhLQzBi?=
 =?utf-8?B?eDlvUWY5SkVIKzROWjE2czd2cnhZakl2ZmRiMUJYOHRNVnNpRlpvajc3dzY4?=
 =?utf-8?B?b1AvRm5Ga2N1K01pYVhMRXBCWkRSM1hCSHBnZy8xMzRuNEsyS3pwWjJ2T0t3?=
 =?utf-8?B?T2lGVFQxMVNVeWFrWjZBSnNCenlJbUVUcE5NR28zRGZzcVB3N1ZlYWd2bWdp?=
 =?utf-8?B?LzloRWJwc0o3cC9zdHBsQ3J1dHZReGg2cFh5N3NoNkR0SnEyYzBXTG55SnB1?=
 =?utf-8?B?SmpYMDN4aVJVTklMSFhuV0dkUnAzZHNlNitmcEpNTWdRMVdkei84ZEJaU0Ft?=
 =?utf-8?B?bjFhT3oyRkg1eUhBVTdZbURBUWVmd2pxUDYvN1lXb2k1a09oT2U4ZjNGMFlR?=
 =?utf-8?B?MjI1dEtEUWd6b1hYeFRLbFQ4ajBVMVZsUHJNS3A5RU1OL1BRUGZiOWVtbFll?=
 =?utf-8?B?blZEQjhsQ2pWN3Z3Y3Jkekp0MENYL24rS1VuRnljaG5GU2huSW92WUJPZmtL?=
 =?utf-8?B?dFQreDJmQ1lYVTZkVnBjWDBhcDVZbmxzb04wSmZ3QkowSHhtMUhWdjBieFVm?=
 =?utf-8?B?dnhUSVlxVW9LUzRWNXJlYkdWbTF5cEpXNWJGSGQ0RWd5WVAxVmZZTmk0Y1JU?=
 =?utf-8?B?MlNPcGVzOG5YNlEwUHQ3V2N1WUpkKzNNNEhyS3JLeWVOM1VWK2VCYzg4d1lD?=
 =?utf-8?B?SU42bWFKWmw1MERMeGFlZXpKY2podXdGd2hLMkh4clVZYU5ubTkxWE9ocUVM?=
 =?utf-8?B?bU5xbUdlY2pnQXhCNUVTaTdPM05aZHhRdllCcEp0SWMxSTd6L1EyZE05K2Y5?=
 =?utf-8?B?Q2J4eEM3Q3BoVG1zcjZtQ2JSYmxtRStxS01tWi9hVjFoMUNzQmFlWUdCM21u?=
 =?utf-8?B?dXMxMEVBaWQrb1FsbFRiZmx1ZjhWU2wwa1ZUbDFBa3dFNm1xWnhndnAvRTAv?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e01137-8389-4792-f5aa-08dc3c27c4d8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 08:47:48.4642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xNe8DGvDYcqIqamZ5nzW/Rrjd+jIQGU4sFn8Ty19DnTK+sq9AakjpaRNjHIsueMYT8ze9C9iG2S9riTtu7HyxffOhEGhjt74nSYflhs8M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6801
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


On 3/1/2024 2:14 PM, Mitul Golani wrote:
> Add structure representing Adaptive Sync Secondary Data Packet (AS SDP).
> Also, add Adaptive Sync SDP logging in drm_dp_helper.c to facilitate
> debugging.
>
> --v2:
> - Update logging. [Jani, Ankit]
> - Use 'as_sdp' instead of 'async' [Ankit]
> - Correct define placeholders to where they are actually used. [Jani]
> - Update members in 'as_sdp' structure to make it uniform. [Jani]
>
> --v3:
> - Added changes to dri-devel mailing list. No code changes.
>
> --v4:
> - Instead of directly using operation mode, use an enum to accommodate
> all operation modes (Ankit).
>
> --v5:
> Nit-pick changes to commit message.
>
> --v6:
> - Add correct place holder and name change for AS_SDP_OP_MODE.
> - Separate i915 changes from drm changes.
> - Remove extra lines.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_helper.c | 12 ++++++++++
>   include/drm/display/drm_dp.h            | 10 +++++++++
>   include/drm/display/drm_dp_helper.h     | 29 +++++++++++++++++++++++++
>   3 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index f2fabb673aa4..f880bc7b2153 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2948,6 +2948,18 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
>   }
>   EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>   
> +void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
> +{
> +	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
> +		   as_sdp->revision, as_sdp->length);
> +	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
> +	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
> +	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
> +	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
> +	drm_printf(p, "    operation_mode: %d\n", as_sdp->mode);
> +}
> +EXPORT_SYMBOL(drm_dp_as_sdp_log);
> +
>   /**
>    * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
>    * @aux: DisplayPort AUX channel
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index 4891bd916d26..e39a22a714e2 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1150,6 +1150,7 @@
>   
>   #define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
>   # define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
> +# define DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE		GENMASK(1, 0)

I am wondering if GENMASK can be used here, without including linux/bits.h

I might be wrong though.

Other than patch looks good to me.


Regards,

Ankit



>   # define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
>   # define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
>   
> @@ -1639,10 +1640,12 @@ enum drm_dp_phy {
>   #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>   #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>   #define DP_SDP_VSC			0x07 /* DP 1.2 */
> +#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
>   #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>   #define DP_SDP_PPS			0x10 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
> +
>   /* 0x80+ CEA-861 infoframe types */
>   
>   #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
> @@ -1798,4 +1801,11 @@ enum dp_content_type {
>   	DP_CONTENT_TYPE_GAME = 0x04,
>   };
>   
> +enum operation_mode {
> +	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
> +	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
> +	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
> +	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
> +};
> +
>   #endif /* _DRM_DP_H_ */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 7df19acdc790..10147ae96326 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -98,6 +98,35 @@ struct drm_dp_vsc_sdp {
>   	enum dp_content_type content_type;
>   };
>   
> +/**
> + * struct drm_dp_as_sdp - drm DP Adaptive Sync SDP
> + *
> + * This structure represents a DP AS SDP of drm
> + * It is based on DP 2.1 spec [Table 2-126:  Adaptive-Sync SDP Header Bytes] and
> + * [Table 2-127: Adaptive-Sync SDP Payload for DB0 through DB8]
> + *
> + * @sdp_type: Secondary-data packet type
> + * @revision: Revision Number
> + * @length: Number of valid data bytes
> + * @vtotal: Minimum Vertical Vtotal
> + * @target_rr: Target Refresh
> + * @duration_incr_ms: Successive frame duration increase
> + * @duration_decr_ms: Successive frame duration decrease
> + * @operation_mode: Adaptive Sync Operation Mode
> + */
> +struct drm_dp_as_sdp {
> +	unsigned char sdp_type;
> +	unsigned char revision;
> +	unsigned char length;
> +	int vtotal;
> +	int target_rr;
> +	int duration_incr_ms;
> +	int duration_decr_ms;
> +	enum operation_mode mode;
> +};
> +
> +void drm_dp_as_sdp_log(struct drm_printer *p,
> +		       const struct drm_dp_as_sdp *as_sdp);
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
