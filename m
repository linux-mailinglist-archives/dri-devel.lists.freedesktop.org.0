Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB25086FE8B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB4710FF3D;
	Mon,  4 Mar 2024 10:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISA3KxiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A62E10FF3C;
 Mon,  4 Mar 2024 10:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709547180; x=1741083180;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D3wh7nu8Wv1NoiTK0vTUDVXofKVqCVHcsiaoW+dMsxY=;
 b=ISA3KxiA0DudS6OR2as6WsHHJFqRmdiyGqEAPkODTjDxZcdsk9hRUkN/
 bhVVWcVMFRS4nSfaFcrsRnPpa0AvFitsAuY2GyGPboRKaQJv/qwxyErod
 Za1dFFKXpilUnQirRyiujh0g75MPi28GoXc0fuy8AdGkurBm4Btpfuf12
 +HmxdeeSuauCEh2MWAjNQAJgYgSuXALj47bvAQFm+G4LqeMBwEknNRQrH
 l4LzUwyAlqYKi0T2cfbZDt/yUw1/oaMBSrI2Q47uEv5I0YgOCmm0bNqXu
 OWDNOx6lxSr9yzjDf4bx3OVuUvkMPaiL1r4v7h7O+FMb9xGcc6juUdotk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4197158"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4197158"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8879066"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:12:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:12:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:12:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:12:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyCFsuGZ0QijjBWA+S0MCtAVtbasYZMROW7/evlF1f8Ng58g2RtxKlyjgw7GndruwVO4prVUmMyd+SfEgdtP2WKNMg+9QlUUPMR3Oa2j3xfXO54GVZp2W9hthGJ/YP3nqeO9rJ+5aaj1EJILl3wNdU3l53C5CV9+Q9Ef3Jl4t7ODyAk+8C5RyemOh0q2WFhOcqIbYWa3tIuKSe5uJcDwvMFxNwZp9IAvf9QKYt09E+M0zXtsj8RbLMQXcDn1lmEIwpOKF2PDjsfxWO3UnDGjnhaTT1+1QIA+vTcRAb/efPe2kuyAXEL6d1zlI/HQ0mJ98hB39MDKTlGITcZVaCzAHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Vg9PhYhWCRkK8XlSvCnQ73v+oRX80co2WETzxPhXS0=;
 b=Ujo/1tkSAldzzdS6FZmdlYvFcpwNcU4tkOw0oQiURZIme9HLQmS88oSTG5VQhi0rb6Np26CjbDtoes9WaW5p/lT9XY+3hB6h0+7IZ/mnKFkPvmjco6K/8BqYpkoC0vDIobsT46y2EIhVAMX60/647swkJgqWmZZUn5kFf1ufQpE6nWovrdHEiSyrrM9JToshkj3DOS6kscpEqKEZXWXdpNwlOpqB6v1d3aqOeVRi3DIroCF/q+nAx0hMEYul0UC84hIFMNiaWMrEaJ7VkfwBSftqV1Po5FNPhmxD0lwDFNothnN5cpqSMcHS9xeboqF2smgblyzKXAIBAHHbJKSqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 10:12:56 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:12:56 +0000
Message-ID: <fc0b7ec3-4fb8-4a1b-af4b-48e586e48c72@intel.com>
Date: Mon, 4 Mar 2024 15:42:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 6/9] drm/i915/display: Compute AS SDP parameters
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-7-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: ec6150f5-70d1-4c74-210b-08dc3c33a986
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RSR+3ZIByfqWv+mL9dPsAcQ/ReIdQQSpHYd5C22XZVhuYG1wiaewJlknLmXyuyf2O+NiTsWNCsaIagkgaxJ/pFVBh2+IlgNScdnfhjlR7gmystXfSGc3Et3L+zUZWlLYlniZzzTujgFLN9LJwOjJsAD9DYmzO+n3l+ZGRfLghv5laKM/EDX/6+b+kIgYGrU7jpgz3Rb65CvGgSQ+wS2EkQweJ092yhZvFmCw4cyBrzOGn6H+kc4/HePwl1Rb7KXq120SHxPYb5IL7G1Ql5138C7FYIVVQJiCcfyFHScXloJWPLt0KDZhRQu9pf9OPXn670IBE7kuboLg/gXN2/37rjPbGZT4tzWlB4Jzm9tVqJ2ejtIlhfdVVOT6WgpxnVe6F/Dxpey7TuIl9EqNtp8jZUh5k5NNEhgu/4nU+nw3v3Nf8pKRKtyZzTeqlBBaqqf5hDLZtjbrGRhZrOkVHKzvxw/r088v3nYAO8kCJ4u0RnTbwPdxC9YIjcqtwfYwwRBdql2JQ18+2kGHshiUnyswYjceZ1SeFfxF26u2hgq/ehLFyB/l2xsF90ls2AMRJOBK4y9QvYOCHX6DAp/J9cxWqt28lgfcPQjDH/AG9+BZl5syVIhjXssHr/BokkJAzFgnN1Bhq4nS1P95Ue1jWMlbLmBxwBIRpRDDKmwjuHgYgyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXowdHdJYXdlcXVmMExCVGVjdkxpSFcwNnZPb3VvWC9jUmt6emg1UnFnSGJX?=
 =?utf-8?B?c21tejFjQXpTV3FHU3FERXYxN1ViRTYrQ211dEM3ZGczdGgySzV4SlFBOC9j?=
 =?utf-8?B?U3BZajFFN2FHZ1c4RjNuOTFqZjdmUW4vcUtmSm1hN0x3M2o4MjlldW9xanBB?=
 =?utf-8?B?dE1TRUlHMklEZUxDYkFueDVETDdvMS9NMXM1aTJsUjg5NlRmNUZnSkhyWGtW?=
 =?utf-8?B?ZXIwUThJRjhxK25qOWFrL3ROZWJaNnoxajczb2x4RVlWVGIzSENFbm5oY2Zm?=
 =?utf-8?B?eDAySEV2TXBMQlJQNUpwa2xMMUpMaDJDblNNR2ZydTJ0Z1Y4MisvTkdlcFJy?=
 =?utf-8?B?N25xanNTbTVYL3RGeDlFcUpWZHE0L1VoWHRLNlFFSEgzZE5kendLNWg0UHdK?=
 =?utf-8?B?MmNSYTJlVHRtT0twd25DS0RSeng5UHFEbFlQUzVqUzFFWVdqME94RnR6eVBD?=
 =?utf-8?B?ODhuNU5FRW1vcjI1cC92QzFoMXREWnNMbmxmMk1SRVcxSE8yU0gzckJ1aGZO?=
 =?utf-8?B?dlY5aHpGWkFJUFRsYVllU0p1UjEvbUt5eUIxVDdRK1BuZDYwdmxzeTlwK045?=
 =?utf-8?B?bU15dWxBWHV5bzZNRXFvWWJNVDZaRDF0ZjlETVJyVXJaY1pDTjZYUGVvYkUr?=
 =?utf-8?B?UVJDS3hnYWZIQTVacTZFNGRHZGxXYXkrNTFwN1M3a2RJeXlKWDZrSVhBWTNU?=
 =?utf-8?B?VjBFcUErWlBuY0RGTm5YeEdDSXhmK0ZWUGtUbWRYcTU0czdvdDhCTHNScm5K?=
 =?utf-8?B?RTF4NWtsRVlTY2Z3cVhoKzZXMS9VWmpNZ2o2VlJVQXlKTVlBRmMwWWhGRGUz?=
 =?utf-8?B?N0ZTa0JtVktMak5vYVY1ZHlLbllvOWljZmUyYWs2ZEplN3hhVjZLVUpRVkJP?=
 =?utf-8?B?emNQVGNwSXdaeWFpbHZpdzJIdE51TlBTcVdqamtyVkxNRUYyNG1SY2NKT3dl?=
 =?utf-8?B?QTR3NVVFbUluRk1wYWtFWHdpdU1ydjh5MFJQNjI5MlVjTHRFZnRYdHozb2s3?=
 =?utf-8?B?aDlVOUNJZXNZdEVXWWdpWmU2a29kYUlHWDRLQnBEZEl5TnBBL0JXdUhQeWJq?=
 =?utf-8?B?SHJURkFJUW1WTWEvZ2FsVEZldEZhMHFha1NxelpmYXIvUFV6VkZNaGhNTzVL?=
 =?utf-8?B?dlpvNGhQTUtQUjYrSmtSQlZqakgxR0R1RDh0UU1JUmhVZGR3UXRkYnZvL1Zm?=
 =?utf-8?B?Ky8xVzBlZnIwZEZhM2lsN0o4L1VaWEF1dU00MkN6aGg3UXZ5SlpjSHFoNlYx?=
 =?utf-8?B?UVlheVVLL3JyTFRwMnJReGdUNWNMdDhsbmhZY3NuL2ZBditMSWFYT2UzU2lw?=
 =?utf-8?B?WU9KODNRd3BQSENRL3Y4UG93ZmJHSk9CaDdIVDFYd2k0TnBVcHFNZzBwMURp?=
 =?utf-8?B?QWhOMFo0MWRnTitLWE1FbTZvYlJnTVIvSjNmdHRUV2JZaTQrOFJSak45WFpF?=
 =?utf-8?B?dm5aR0NKbEFGMWUyaGFsQ0xnVWo0NUZaMENpeWRYSzQ1TVFMWlFvS3FDbThv?=
 =?utf-8?B?RFNSdjcxS29NckRYQjBEQlIwdXFsb3BCdVRJdDErdEdUN25JNlhYeThUaVlv?=
 =?utf-8?B?VUVTZUlOVEt2R08zc2tXdnVHK01Gak9tMnJzZHoxNGlURDVvUXQ0bFhUQjU1?=
 =?utf-8?B?WUtsWEpHZCs4dlJFVW1YU1FqUmswWFViWDBZYlZob05pbyttMTRBSzU5NjdZ?=
 =?utf-8?B?R0pPdzdjN3BrVGNMdnhkZ2hDb1U4YlNpMTgvNXZ0Y2VtT2ZSdVJwNGVjWHlO?=
 =?utf-8?B?Snc0YjdHTFhZWkMwTmEzVzBEdVZJYVRhcGVtejJHRXFJSk56TXhhN09tMUY4?=
 =?utf-8?B?ZFdFYTVxelpWNjFhN3FlOHVUQi9EYjk0ckM5RkcyU0hSUU4vRE1sQWlzMFRD?=
 =?utf-8?B?ZExoMUhVbVlrbnhQREIvZE1EbXNlMlVPRTN0dW1nS3djcGJuWm9aN0RNaHFT?=
 =?utf-8?B?UXpndUM4Z2UzS295N1poNW9mbCtVaytpaStubU1zSzFIY1FGZDMvR0tyMU1K?=
 =?utf-8?B?U0pGSjZNdzJZRzE0anlpOHV2UWNlV2psbTEyTnVCRkplZWZRY012citBVlpY?=
 =?utf-8?B?NEwvSk84eVF1WFppTXpjZGZ1a2I2NWtQOUlJVENlbU1CMFFuS3lmdnRPR1F3?=
 =?utf-8?B?ZjR5b1ZlMWErU3hhRkxPNnF6eGg1bElXMEJNbEFXdGJiZTUxdkpnSGhjMGE1?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6150f5-70d1-4c74-210b-08dc3c33a986
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:12:56.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDAJCfdPzu+quQCO6E71biBEbDHyZHYlPG9Ts5ewm7DtFLe9N4Qn2F6NK7iHmBMjLieIZrPwV9TITD7sBqbHCI2SyyahQv+TY1DYVKuGDyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
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


On 3/1/2024 2:15 PM, Mitul Golani wrote:
> Add necessary function definitions to compute AS SDP data.
> The new intel_dp_compute_as_sdp function computes AS SDP
> values based on the display configuration, ensuring proper
> handling of Variable Refresh Rate (VRR).
>
> --v2:
> - Added DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx(). [Ankit]
> - Separated patch for intel_read/write_dp_sdp. [Ankit]
> - _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward. [Ankit]
> - Fixed indentation issues. [Ankit]
>
> --v3:
> - Added VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.
>
> --v4:
> - Added HAS_VRR check before writing AS SDP.
>
> --v5:
> Added missed HAS_VRR check before reading AS SDP.
>
> --v6:
> - Used Adaptive Sync sink status as a check for read/write SDP. (Ankit)
>
> --v7:
> - Remove as_sdp_enable from crtc_state.
> - Add a comment mentioning current support of
>    DP_AS_SDP_AVT_FIXED_VTOTAL.
> - Add state checker for AS_SDP infoframe enable.
>
> --v8:
> - Drop conn_state from intel_dp_compute_as_sdp, as not used.
> - Remove fullstop in subject line.
>
> --v9:
> - Add vrr.enable instead of is_in_vrr_range.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 26 +++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 1b3e7ae3dd76..ef1543205ee9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2620,6 +2620,31 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>   	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
>   }
>   
> +static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state)
> +{
> +	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	const struct drm_display_mode *adjusted_mode =
> +		&crtc_state->hw.adjusted_mode;
> +	int vrefresh = drm_mode_vrefresh(adjusted_mode);


I think you missed to remove vrefresh and connector, as they are no 
longer required.


Regards,

Ankit

> +
> +	if (!crtc_state->vrr.enable ||
> +	    !intel_dp_as_sdp_supported(intel_dp))
> +		return;
> +
> +	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> +
> +	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
> +	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
> +	as_sdp->length = 0x9;
> +	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> +	as_sdp->vtotal = adjusted_mode->vtotal;
> +	as_sdp->target_rr = 0;
> +	as_sdp->duration_incr_ms = 0;
> +	as_sdp->duration_incr_ms = 0;
> +}
> +
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>   				     struct intel_crtc_state *crtc_state,
>   				     const struct drm_connector_state *conn_state)
> @@ -2980,6 +3005,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		g4x_dp_set_clock(encoder, pipe_config);
>   
>   	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config);
>   	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>   	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>   	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
