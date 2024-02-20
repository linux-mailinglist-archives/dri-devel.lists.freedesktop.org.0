Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C857585B2DF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609FE10E11F;
	Tue, 20 Feb 2024 06:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W2Lc1FWq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794D910E094;
 Tue, 20 Feb 2024 06:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708410323; x=1739946323;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v2yujn4QezgKR7QrskZkFxTGglrQHmEjjGv132kzqEM=;
 b=W2Lc1FWqJQbwuLmabPKXK9xEjrFSAvQIoL9LxWcRyt1Qnk7wOQ04hky4
 58h/QJPx5TrBXPGwY8BDkVWY+CmjoYh1FR+AjLn1zYywplPhhZmQVNnIb
 6zX00WOR+b4j76CJKFVKaFecxo+bnCqLPnOM/hE9Lfkotf01iemLMH6eg
 Iun8aj75HHeP0uIdkV5b3ZiQ8EcHkuV7y+Ix0U60pbj3VovEXXojp6q6H
 O85tQZ1yQNyuXyV+afbW/y9joC7zgNR50C6o5DFuP7Nalb+mt4gRb8+Ac
 q6999Jw+uvBNlYURT1HdMAD5zSGUpMU7Myt3zRNvQ/pHEcEoaUp8CkTP8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2366938"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2366938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 22:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4679194"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 22:25:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:25:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:25:21 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:25:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBBRDjJZB2BbQzxlZQF/sPATGq+2JVnOc9xppgTPijfktPrqxKqbOCk9vEu97jWDs8vV8StExEI4RfjP0dAQRtI5DFNy+v3Cl5sUZDb+3vasSW8VKEwDEGkdciCq5prRmbavvpHRyTR/yVUG44PKuO+6NJR9+icptm3XkQeFOy2Q9JG6GuYaNNY07mTdWU9cgIVdalPXgH5e4QOSg5c3PlvKOHytEcpqrv8f8zGa569wIa4bfYSeiAy+f+VU61Xwc8txsg9ARZFDi4GhwgKJk2XmMya2hOnKqItiYd0+840X37P/ceowdaJXKdTBnfjB8qMwuiwq5TKyUhTlJ8N9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WLHEMqXMhrq0kIQeeF3EPYx87AFaIc5B7X/HqUGMCY=;
 b=IvpMWwuON7xVA/QHsI4zWyoNSvjPBcieYr5dbGtty+KolURZYhbCwSocPgbrinIzLtvvi2qe0x7tW4/RJ7VpIlNJ9xZTOQn7y9V/A7s/cBkua3tlcb0r+VBK9l+sl2JvY0Q7AKOtiSkqXBhHlETVpOwSJuzqzrYhuIssawgdsMlngk+YDQCLb0sqDUsYX7aEeVORAuEKqATadq6Zun7vGbcI3WJgmIz3OeQb4OyGbEZdWULgY79kuhExTPNLhmZh7UvHLOWzuGb3ikJpgPZhfQqSWXB9HJzgKrzZIbFlgg3IiidcBRnmUJ6XbNsOpke7Fx40ISV9BiYpjhoE6iRSWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 06:25:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:25:19 +0000
Message-ID: <084e00fb-7f6d-4d70-a4f8-61a8c65a2628@intel.com>
Date: Tue, 20 Feb 2024 11:55:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/i915/display: Compute and Enable AS SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-5-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: 735c6ab1-96fe-4951-fada-08dc31dcb57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bLDWuVeqn/cFpP9fWvTlFuf7D//ictsE5c1CrZNBcy6yuA8yvZPrMZaxE1wwTiGXOL5fpZ+StjW8Q19DiGqKHq7nj2V+hIQ9+VfvsSh4nU6AtxSiClyNgE6JXtxgKdFUzUponT4Oh8hmz8m9TPWmt2Jezg1RbEis5kk/Yyr6E1XcX1J3YoaSbrVgLNwPQCYbK2FTrzZqQg1N3DNBpWDtnLw27S7M2M30i0byvQmt0G14K31gMPezVmi3U0hE13HxDxilYqpBHzzeajNXiHNqLgqvurf4bYTEYELU7JoWaXyuF+N15LDeiyNbc5Ml5o8jB6CL/5MmdMnGYm8LfCxErxfxnjg3A3YToAvEBSDB+ve5nGRbDHzA3NBqvD6GNjO1q8Z7r8sjOUykAufG00iSdHw04zbQa0Pa50RT1E0wYZX6tpA7ZiX1Wm8yWLn0Sie4XKg5Cr6/B4g1/MeyUwBFOOiaBlloapTNE9FoWQR0TEsLrebfUPqVywn8dN80L1/JZPInnd3FygQdgWcXSETweDnPQxJwEbXsmkpcjBQIiNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZBMmZSOHgzZm9pNlhEUVI3dnNEelM2OWk0N09sVjI0KzkwZkpiN2NvSE9D?=
 =?utf-8?B?RHlIUmN2N0Y0YUg2Y2wxemJNSUEvdVN1Y0FoMUE5VDk1K3lQMW1ZZ3diMnZz?=
 =?utf-8?B?ei9UKzRjMzVZcE9BOXczWTc2WlEvUzZyVmdWMWVJL2ZMQXhmZjV4WVZjYXRh?=
 =?utf-8?B?WHVCQ2tnbUt6c3JGUDBDa0F0ZGdPWU5LbTNOQVI0VHU4WTI3WHNYNVpXbXRI?=
 =?utf-8?B?NXBrblZzUkxiYnJOT0dEekJEVEMyemkzdEZ5R1h1aUhrVjhsRWpQdk9BSjZP?=
 =?utf-8?B?SDJxOVRGL1NINlBFZTFZZjl5TC9SSmpKRFZHa1dKZE9TSk1KS1FEMVBWL3Fq?=
 =?utf-8?B?MnZuMkpUMDlWU2dHTjF2YlRTeC9ORUNHdndZT0NZVjFlOUZUajdHUE96YUY2?=
 =?utf-8?B?KzQvK2syQVEvanlRaXZtSmFxNlJacXQ1ZzFhVnJTWnNYYWF4VG9iNTVYdXh0?=
 =?utf-8?B?a3p5VU5VQTBrL1pzVWR4dmtqV2p0cXNvT2VwWlRVbXphUmdQQW5uK1BLR2pS?=
 =?utf-8?B?U2RyMThlZ1lxQ0xCZXFyTklFVzFxMk8ydmZWQkkwRHhQdE81TzlSa1dLVS9M?=
 =?utf-8?B?ZXgyUWhOZEhKc25HQ0Q5NUFVeGtzYmg5ZEUycFBTU2hVVWR4eWU3UGMxcHRL?=
 =?utf-8?B?cFA5MTEwVkdXR3JEc0VNR1M0N3JrV2tJYXk3eTRTckdEZ2tWQ3VialhCaGVv?=
 =?utf-8?B?VTRXdFN1Q29yRzFWN2I4NkxMS1JwSTliaDVlVlN5ckJ5amlRVEduK0NvL28r?=
 =?utf-8?B?Q2xsaUdCOHNZL0ZTL0FIYmVhcFVyK0VGVlc3ak4rUDN4N0pERXlqc3gxNzFD?=
 =?utf-8?B?ZzBCaVU2Q1A4bS9KT2VheDVYbjNNZ3NoNy9XRndtYUZlVjd1TW1aVUlWajRY?=
 =?utf-8?B?bmNQOU1Xa3ZXc3AvejVuS1IrUlhSRUVETGtaZHVRRXkzZ29sblFWbS90VU11?=
 =?utf-8?B?THozbmo5S1BrcHA2STdYRStrNlVpb3ZiekZkVHJLK0pMSmJyV2Rud3VKWlVh?=
 =?utf-8?B?WXV1N0FIMU0wZEJ2L05DbUl0U0NzaEgvNEpBZHUzOTdOME1oemhkcHRuQjdM?=
 =?utf-8?B?THB4K3pGKzZPOXB4dFlSN1R0b3Z2WHd4R01rcXVnT3RhMHZneE5OZG9zbGN1?=
 =?utf-8?B?VHBHeVlwR01MWnVaRW9vSVRQVnFPMGJySHQyQ2w2Zk5MRkxKZXZKb0FJb1dO?=
 =?utf-8?B?akdWdngwd3IrMEFKZnVBemVyd0R6SVBSUjBPTWszd2txR25xYmFwVFdSQmZo?=
 =?utf-8?B?Um0vVGtlazhDbXpMZ2hMSW4yNkVOcmxqTkRuVVBxbWJmTlZwcUo2VC9FbXdM?=
 =?utf-8?B?NCtmdGFBQTJCU2crbkczNk9uUzB3cXFNYjVSM3NpRThud3F0bzhuWkErSWdG?=
 =?utf-8?B?MkNQM0x5ckFMMm1sd1Q3b1RnN001YjE1dXdQQUZoa3YveGg1bHgxcUpEVU9x?=
 =?utf-8?B?TTh0REUxVlE3ZldIVkpyc0pDa3NwejQrSFFKQWR0YW03VEVtRU5tSU1IOG9t?=
 =?utf-8?B?MXcyQTJVd3VwbEcvenY2UnN4bGVtMm4zMTI0Ly9PV2NTQlVqTVRXcWdydWFR?=
 =?utf-8?B?L2Qxbjc5U1ZRNGFXRTRuWkgyNnFBUUk1di9iMlFNbWtJeitxZHlGVXZiMHBB?=
 =?utf-8?B?QXM4MXl4Wkc5UDFrMmM4V1RPRlZQclhkSkhWMFFETkYxNnQwcld1U0sraXRk?=
 =?utf-8?B?cEtuQW94MTE1NENDa1B3UWhQbFhUTTBHMEQ2RndyZUhEdW1FTlFMQTRRWHda?=
 =?utf-8?B?K25YS0lPNkVEVzNub29OWWhxZ1BhZkZLY3lIeDJiYTY0ZmpBVG5CNlNGK0xa?=
 =?utf-8?B?akQzQlpiS0pVd21xenpvdFZPN3RQYy94RENjSHdtSlY1SENCVXE4WGp0K1NL?=
 =?utf-8?B?TEZ4UFptK1p6WVlTSlZtUzNWdFdQSHFweHBxNVhWSER6M0JvOWQrS0dCcmJv?=
 =?utf-8?B?b0hjOXBBQjQ5LytDUWFkRmlkeHYyWFZGbWpJRU5GZW11UXFMZGJOWEtlTlpW?=
 =?utf-8?B?VWtCUFBzMWhKNlc1SnpaSUFIejJWRTVRN2tEVlB2eVN6N05pelhabS8yd0Rr?=
 =?utf-8?B?bEI2Y2U1SXluYTdQVzh3U1VoNENYc3UwakpYVUxhejBPUWc2MFZsbW1RaTJa?=
 =?utf-8?B?SVhuNVNLRjkrdlN4MG9Rd09XeHhWNUpJZURIUXRuZW9naFVBOWZvbGc4Y1J4?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 735c6ab1-96fe-4951-fada-08dc31dcb57f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:25:19.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPYENZLPMxM8cOeA3n6+Dr7Mj0vNSJtT5fEkccc5TFjX7DGqB7qRHHUL6V9jRfjWnwYaDKj5ohSeogV6SAaDmiTeSgheyk+6+F6N6v4IFbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5395
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


On 2/16/2024 7:50 PM, Mitul Golani wrote:
> Add necessary functions definitions to enable
> and compute AS SDP data. The new `intel_dp_compute_as_sdp`
> function computes AS SDP values based on the display
> configuration, ensuring proper handling of Variable Refresh
> Rate (VRR).
>
> --v2:
> - Add DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx().[Ankit]
> - separate patch for intel_read/write_dp_sdp [Ankit].
> - _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward [Ankit]
> - To fix indentation [Ankit]
>
> --v3:
> - Add VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.
>
> --v4:
> - Add HAS_VRR check before write as sdp.
>
> --v5:
> - Add missed HAS_VRR check before read as sdp.
>
> --v6:
> Use Adaptive Sync sink status, which can be
> used as a check for read/write sdp. (Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index d68fb9d45054..0759266e7bfb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2617,6 +2617,25 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>   	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
>   }
>   
> +static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state,
> +				    const struct drm_connector_state *conn_state)
> +{
> +	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	const struct drm_display_mode *adjusted_mode =
> +		&crtc_state->hw.adjusted_mode;
> +	int vrefresh = drm_mode_vrefresh(adjusted_mode);
> +
> +	if (!intel_vrr_is_in_range(connector, vrefresh))
> +		return;


I think there should be 2 variables in crtc_state->vrras_sdp_enable and 
as_sdp_mode.

as_sdp_enable to track, if we really need to send the as_sdp and the 
as_sdp_mode to track which mode we want (AVT/FAVT)


We fill these in vrr_compute_config, along with other members like trans 
vrr_sync_start/end.


Here we can check if as_sdp_enable is set, if not we return early.



> +
> +	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> +	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
> +	as_sdp->length = 0x9;
> +	as_sdp->vtotal = adjusted_mode->vtotal;

Here the as_sdp->operation_mode should be set which is computed in 
vrr_compute_config, as mentioned above.

Other fields will depend on mode that is selected.


Regards,

Ankit



> +}
> +
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>   				     struct intel_crtc_state *crtc_state,
>   				     const struct drm_connector_state *conn_state)
> @@ -2942,6 +2961,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		g4x_dp_set_clock(encoder, pipe_config);
>   
>   	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config, conn_state);
>   	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>   	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>   	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
