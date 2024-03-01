Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C423786DCA0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2895910EBEE;
	Fri,  1 Mar 2024 08:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSEa9+ep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19E310E11F;
 Fri,  1 Mar 2024 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709280065; x=1740816065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJpxw6CwfNKoLj3otdv++WCcoJ3GAArR33kISp0K6gQ=;
 b=nSEa9+epeCPl6SQf/HWEFFx3oq2kwfViwdKREBqQOvGWLtd5ZEwocw0s
 JHC4G6AuESKhsF4nAOFSsKvQnP+joQNlpmsuI0mRZ1d/I1IUCS7Jkh73T
 NWtvLqLTxyuczcWw7OF70hyQliuaYg/m9ZBJ+BLodoVMWsJmJCSCf3iOE
 v6PXcHm0pha92sWWiyn8HY1erXCoKQFcJgLbO69VeGxapI1Q1JGeDsL2k
 054w+4NjNonPGPH30olDYHxZgniVIryLc8DZylnp0RSTFSxWQoTHwoYi4
 FEmii4+SGtDCMr3vPSxRosfWCY4edRLgON/RfDXpTcMR1/iUMkDU3tJ60 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3922459"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3922459"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="8051874"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 00:01:04 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 00:01:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 00:01:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 00:00:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDx+iOO2YPcrrwz7aLAhXbMYZqbJ4vI8qEq8ciog9ySKPr/TRm1reLs2phdc98u8pu1tnweT8i2j3NDwMJdYl5UvrcJf/uM6TXx+w2QAeZX+xoxGykiOENo1FJ5PPZ8pg1FXkIToYfUQhT17BGi2x/pHiSjmhrnxc1CwrJBl1K3vPUJ2+pt+y+VFYl2mSbjyVQ0BFJjqXhYGMgJVe/Lgt2A6BnS79S4sm83VTHCaF5reoQZTAnve1AAwFQr1azgAOozlY6Yo3/m7hUWtNqrP+LKq2fYH1DBuAVWK26x0M9tIPfC4oN8/vBvr2urcajSAGsHg1816duWKNSKRVjTKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUJAeYlQYK913Jk5yj3FFQ0FcIQcet27iyvST8+H+Eo=;
 b=b7iM9gpixzY7QRbI9k5IApePqMT7h/zxluug9W6WLKSjHmhQqegZIEARi0cPjKg+LvdbTIRlpzvc8NRVVnkXY1p34sST2G08I8juQ9W2upyWUPBcvB+2EGaos1ax/TEpqDWxjea/ZmdPtmPffT1zcxSHKko8jnNmhZKYzvyFNM64fLb5OOb5HoHKhITeWWpHemQpe3Fu4HHtPMWL+4LkjdXx7b34dz9w83HuHM6GWfDuKGAUSm4WzXNTVk8ra4imN399c21ZeE1kRqNg6MmNfB6AtBYih1+FCep87FCdY7whSWNaDMFnd9Aqa/KY/clGr/z5MbB+z4fR7aqXvoaBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.17; Fri, 1 Mar
 2024 08:00:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.015; Fri, 1 Mar 2024
 08:00:31 +0000
Message-ID: <7af4cd3f-6b44-4e45-996b-2dbc5b32aad5@intel.com>
Date: Fri, 1 Mar 2024 13:30:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 6/9] drm/i915/display: Compute AS SDP parameters
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240229163957.2948182-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240229163957.2948182-7-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240229163957.2948182-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: dfeecb48-28b5-417f-75f4-08dc39c5aa44
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JtgFa812wQ8/9c0a90ke5SUH/c7NNkQcLGCpLXTbnXklNvq/ttNOjvYA/p2SUDugJS3gD84eMS2uScrIp1VEMkw4rd/2ILFxJUoQ8LHlhGUYmpnbViT73rHKEq0KORc6j/7MWXAxalX+w0Kt98Mq6buRnGu/e6zVQa0EcRmMphx9+ig81ARrhmrQ1qpk9uUGQRt6Ndj3fnrgvkx46pIVPYTn18KjT64nZPvtj/sgQ7eVPioBO/c7FslGgm63jqOsnMdsEmPkk2G6Ew1sprbNZDUl8UB4XxMf/BK+8WKSNtVns75cwK1dsCFc9rwhekNNEQeDntRZbG0WE6uWJDEug1Yh8PTpvFSc/6ls7eBxPo0MiYOY+f1IEFCVUkeNL9805m+q9XXsfaQX++iUKADTrEeVMzIjVdD176ymLUZjmetTnSi0WMOSqz5HlQDvkOtQccSOKhXh228UIoVk/DOXTSXlaZCcbyCYhsnjP+lsY//pQTyEry4QTqhhZGTwYnPef9VxRQFQWN2kvM1hS9XfPSUHoxcvJEm+Uczo+Zm4p9fUbtCLitr7dO4AupBkHjQwJEChv1Qqqn/44R0ZitdtWr9P6daioIaVw4L0cfzcuO7lhk/fwvMA9PIM6kwLDH+vQCE5p/IsYf4ajPz4efoBnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkhlMm5wcTMxMjB1Ym5PaWg5aGhUVlpLSWlRVjNibUIybUh3OHlXZkxFcWZJ?=
 =?utf-8?B?L1pjSTBUREUyRmY0cnNmcldCVDNjbUtmTEJybXR1VWp0M05scjhoaVZUa0hI?=
 =?utf-8?B?ODZqZTRPZHpFc3EwWlhwUmpOWjE5emZVaS9VVUNwVUlLSHlldkZPdWtlelRB?=
 =?utf-8?B?N1R6cjZrUmJ3eWJLaXlta3JKVE9FVjhtZlhzQ3BFWUlLMGJNbTV4dlhiSW9z?=
 =?utf-8?B?Zm1XOVhab1p5U2NDZ0dOd3NzZWpXRGlCUlRBM0VIVEFTM1ZJaUNVUjlVVldw?=
 =?utf-8?B?WTBLVXRJRTY0clE0MGJ5YVRmS3htOHhTclpiV3NOMTBIa1loc3Mxc2owei82?=
 =?utf-8?B?anFSdDU0bGlEMmJIVlgwbzM0TUp6d2RLTWhGL3hIT0dFc0hSWFp3czZxVDhC?=
 =?utf-8?B?Q3lTYmNKaWxMS01HL0ttODRpcUlKNTZsaXdFVlg0YkF1VVYxUlZWR1hDaFE2?=
 =?utf-8?B?ZGZqaFBQQytleEFhd0dVdVdnMU84eGdJNjhOdE5RcE5EZUtYSHBkRVg3dTlj?=
 =?utf-8?B?ZkE1RGlQZTJndU9FUWo3WTZMZDZtSVRsMzdkcjhlOEJaYU0yazg1QnZhY3No?=
 =?utf-8?B?S0NhVHVQMkpoaDUyV3dydEV4SURaN3MyMW5jeURVWWxTRnlnT3p0WUxnZklU?=
 =?utf-8?B?bWwzeDVTOEI2VHBxV3JZbDF4Tm1mVU56ZUR3QkYwb2tYWlVkNkxjTDY1VUZW?=
 =?utf-8?B?eHZKV1dpa0s2b3h5T0FjSkZvYXdEeTdubEFsNnBsa2o5Q2dVbWhDMEFjUnVl?=
 =?utf-8?B?Ny84L0xSWGxjUVczRis1YUdFbEZ5bnVydFJqKzFnNnYwSU0vNm1ZaDNwV2lJ?=
 =?utf-8?B?Nm5ITG5ydlBPd09ibW1CUkhXdlJSRG5CWG1GK0p5UkhpanZJaHkxWmN5bnRX?=
 =?utf-8?B?eGZJNm5VdGRObm9iTURkN0pPSEFybGd6a2VYakExdWRBTmlFUG9hVUt2dlZn?=
 =?utf-8?B?c1BhTTRvR0V4YWl1dUlBMjd5cXdxV25rU21SZFEvVFNQREtUV3JNK2VXSjNl?=
 =?utf-8?B?RnEzUTNtUkJEa1RzMHZIM1JsQm03SHQ1R2VwdFBBbUJlWkptemFIRGRMTDcz?=
 =?utf-8?B?NUlCbmZ1ektPS1Njblh6bi9xWHo4R0V1Z2J1Yi9DY2c5VEVsQnpZaGp0UmVB?=
 =?utf-8?B?K05RaG1WUVdEM3c1bkZsY2JLQllmcElnK2VvU1luNGNqc0FnczBDdzN0RVZz?=
 =?utf-8?B?VDNNU29rWUY0bVZKMHcvZEQ2bHhjVm1wUEtDWkhMcjVoTW1LdDR6TWhnR2pl?=
 =?utf-8?B?UWdiUlk0S0Z4RFBSRFVML0JUeHpWc1RmKzJYSnFiU0Jjb3QyVStvQi9kNlVi?=
 =?utf-8?B?c1BxMXpDNUl1RjJPYUgyVjBRRmpEZzNGUkYzQ2Z4SFdWSEN3cC9ja1hwdzg4?=
 =?utf-8?B?ajBJSzIwYzhScmM2cllxWFF2bnJ3MXMzN2NHZyt4NkIzVTVhQzFxejk4c0VF?=
 =?utf-8?B?bHd1Qzd6bWMvNi9XODN5ZWxrc1JqU0lwdFJ3QnhPZGRHc0h2OTNVYTRGUnhI?=
 =?utf-8?B?QmJjQVB0SnNnRU5KVE1yMVgzMUMzYjZsNE9CQlRwTHJ6YktzMlVtL0VFcHYx?=
 =?utf-8?B?VWowY2lOa1lyUTNxV2lCRlBxZ3NodjQ3TndhZm1HYzJOdnRwU1VIdUdINlFK?=
 =?utf-8?B?T09OaW1nK2w3V001UG5iOExTNmpRTVpEVGUvUmU0aXFjRXNNVURWMjBOaVUz?=
 =?utf-8?B?MUtqVVVUSkUyK3BuNWYxYjQzS1d5Y1hSRXRpZWRvU0wyYkJ0WFR6aDZDNjJ3?=
 =?utf-8?B?ck56dEozeU9tZDlZczJSTmtacUVGdWlkcXNtcFhML3lQVkRERGI2S2NRd3Ns?=
 =?utf-8?B?cXFEc2ZEZEg0K1Y2U3g4RGpMaUtnRmZZL1Qrb0pwek9RK3o5WWdWeHlqTlRa?=
 =?utf-8?B?L0xxS1BmUTgxVCtvVy9PNEErQXpwRFBRSmlKb1d0UU9ScGJmVFZ2K1h5ZEgv?=
 =?utf-8?B?TWJWSE9YMUpuQVQ0Nlp4VjBnUXRYZURwTFhDMk90YUZUNXdyR0hEbnNtYWZW?=
 =?utf-8?B?NDJDejhYZ1diRzBxOVhyQnpOWFhJcStNQi9iK1VodkJTYzNDY09vWCttMG5I?=
 =?utf-8?B?VnlRNVh3RmlyMW9GTGZuMGNmMFpYN2VTamExM2FQZTZENTBuN0pCUk0wKzBm?=
 =?utf-8?B?MFV3VXhySXIzeWc4eGdqYTBCMExWQ1BTZklRbEJ2ZWFobHpNQ0ZJbTJwVFFx?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeecb48-28b5-417f-75f4-08dc39c5aa44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:00:31.1172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROHBzrNBNM1AAzICzOM0sEHsXHDkI9o2/eNDchHVcs4Be2m6UJpgB36BsZTyIWkqhyJJmf8EIgGbWMGb75X8Zrs33dB5oMzuw018XQnRDr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
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


On 2/29/2024 10:09 PM, Mitul Golani wrote:
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
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 26 +++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b26efce4a041..86de854516ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2626,6 +2626,31 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
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
> +
> +	if (!intel_vrr_is_in_range(connector, vrefresh) ||


Instead of this we should check for crtc_state->vrr.enable as we intend 
to send the AS SDP when VRR is to be enabled. Sorry for missing this 
earlier.

Otherwise LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>



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
> @@ -2951,6 +2976,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		g4x_dp_set_clock(encoder, pipe_config);
>   
>   	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config);
>   	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>   	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>   	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
