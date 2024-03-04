Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E18BD86FC1F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 09:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1A10E7FB;
	Mon,  4 Mar 2024 08:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYMSEpcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D6A10E7FB;
 Mon,  4 Mar 2024 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709541896; x=1741077896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zM6UoHMdKncI0nnhYgMYoiKFE9SnbxMxo1Rtx2BUf2Q=;
 b=AYMSEpcE2lX9Ixh9AN/l6Qew932Oe/dITV81So1SHeuYt35nFmHk6RqO
 QiC42NdBO66kosgiRm1ATlP9bKXr1DKKGkkp2ebGruumL+O32hVyQ53BL
 tJfNpeVT3D/4e5o1wlZ1oXVIIK0fyWD3gDF0cw4wiZ8Bxz4ROxvyQl7W7
 Zc/wjP6ZuHAaCKPLJ6HsTlk3h4WmxKc/MOAhFybQ5UTFLA64mUZuS+kGF
 Ro5agIF2zY75Kgp2KJNV/LZNvwJ64Fd0NkS3wuHVrJoITtRQdxBSM7KCx
 VYoJ2B6CPwy0+MzxRhnAvnG6WShkweBKI7pbDHHVLnJ5tVtRMuYJ+sykc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4144567"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4144567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 00:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="39915876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 00:44:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 00:44:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 00:44:54 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 00:44:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY8LJEMhv0dNqXQ6kk512P8ag28EMKnAiYW3ROIOneBPvzDt8VCbT3WDGkL3hcHzimnSrTNPKWv8lQHMzwSjEWZIXJUfyXuBCUGnpxxxiHKMZuRPWM13QsaZNNH1S0DxfSpXHJGrgGiu85zDxkNjesNw4bG2HBCpHMB9IHmVpOMjDidkulc7mX1LVXaX3dGWY0mPHTnkHlk7rGi7AU0YfFGVharIL+UaZRLxSMEj4mrQeIu2IY+oplr8peMj4z9Dc7saBK013vJGp4PBqpJC0GWU7dI+kU3c1HWfNjEWj65bgo2bjZSaILfzolt4JQLV7OCrz/odu/q93iTk4j7hBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQTUbUDR9ZYnqtWd6kb/0a3Y6aHP3vlwNrRyP3J0bDQ=;
 b=RlhDVZ1OQ/AsKgg5ThP5hcUF5SsLIagRGRRFbydUnY04fuj5gKdrZ5fxSNS0Ie6T1p4Wl5JHa66EzeN9ae/YlUa5nLmoSYKMpL1X6ydBPshc0ZB0mcsg7v0yR53cpRiICQvXSrF4KoZpMBjQpYvI+BGSdPLNRe/0waF/WVIu37WC9NbNycN+g1CNNjhyyY0BPOO+yliYT5Ku6biQcqWvorYzwTKhhPq2t/uYvGwYrp6uoEaPdt0InVtTtt7H0vl1yy9rdDlvDLxf8CHwmrtPmZmw5DwB8rwe6ZNYb3QAZ3AqlpUoaztHoUQGsH56XefRVZ4mBIJ3DCImlcqGem8KMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB6801.namprd11.prod.outlook.com (2603:10b6:510:1c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 08:44:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 08:44:51 +0000
Message-ID: <7c90afb9-9323-488c-a4de-510e6e81ae6f@intel.com>
Date: Mon, 4 Mar 2024 14:14:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/9] drm/dp: Add support to indicate if sink supports
 AS SDP
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db61ce0-6869-4f36-95d4-08dc3c275b66
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gjHeZ2ncwxJlR19Miw31x+DNinnaSXyst49GjktxHgSybSAWg0pIC/3wUI3fZh9UrNQvrDVOAwZCIq/nFp7vzLUB0lBoR4VKDjBV7lkT/HPZHRPbkaw7z9DbmdtJC3+Gh6ICWihqKKXN8qPZc9WQG6x6vsJ30d5q6nhgp7BHbeOWb3WhYEXSqzPJuM7r0DsXOkMByOXangejm1tH7aabGcbKMWGyrJM6AJSmMbMVZL0IiOT3ZcShLmrKg7XlL1LqMoBn1IrxAgSjJLY1Ows+OC88VpVv0Xc4QR3zhU0sWXaAtUx0wXgMhyL1MjVpj9JgTSC04dbw6BLNBPX6HtkjuRYHqG52nB9HQuscj8lqO5AOnAzs6mpchmPMbsza7USf+3PqxpVhEJycSTHtXVa1F6Nlb/TqjTD9E4vAjjJsP+rpQ8yFlyOVvxR7wKWS0FRxtQVESSIVt8U2lDxn3QUWpv88ORfwA1eVJ56/0gs87Bw1iAgUecBmeKrGIw+NUc+K7R8jZRlG3Mm1SOmE5Fya+IWPT5Zz4tSdvol/auT7pDo+hvYV4e96DX1VOE5UN+tBXPapMHiJbjrgi7+9wpUZlaVMFQmvl+z1d4Bi3hSbkx3UfORN2EYlEPZ5cTiL0Hl1h+JF+uyRl31h/xMC7OXBgJIbs0G5r04OUGJpxQ4ocZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVFTaVh3MVdobVBxaUF6d0hoOFR2dFk2am5ZV01jYzV0ZzR0MUZtbGNvM1Fm?=
 =?utf-8?B?d2RNeGdrTXN2RllLNTBhSExpSDdFSXdYemk2UzZoL1k2cHoxaFdxaFdvUXZX?=
 =?utf-8?B?QkVQcUxoQ2hxTFJsR3lsbjcxWm4xMXJJVFNQdlZyaVhzYXQ1cU83amFMS0dy?=
 =?utf-8?B?bEFLbUlOUTFUcFdqOGY1TSsyeDk1M0h0ZERubVFaVFc1ang5YmpRRFF6Um14?=
 =?utf-8?B?MHpSUGM3RklpdXloRVhxNHR1NGlkVCtpL0ZDN0tIRkRQOUQ2L1VWYVlYRmFm?=
 =?utf-8?B?cHhqajlPT3dhOXpXKzJLOWpsYmhKbXNUbHhmekQrSm03eDBVdG1HTFNnS0FE?=
 =?utf-8?B?Z3krNUlqZk1lTkpwLzkzT2NaL2ROajQvVXdOQzZNQUo0R1FibU5wTFBFMjRi?=
 =?utf-8?B?ZkFGdXRwQ1E5YThDbVNrRll5bm80STRra29XTFNHUTVtV29xWGIvVmwzenU4?=
 =?utf-8?B?ZnZQTHB5TU16ampLQUxJdWVBZHcxbGRJY3pQWGIzNU14RzcwbXJTZ3EzK25T?=
 =?utf-8?B?Qm1MMjZJSEQ5NUdWTHF6eUhPeXZLYnRZc2o1RVE3OXRYWkROSDBKN1JNMFRu?=
 =?utf-8?B?ZWRuQll6d3NSM0lJRzhWeHRUMDdlS2h4WVRPTzhZMThobzlhaUptcEpDTmxB?=
 =?utf-8?B?dGQ1dlg4RTM0dUx4Y3ZsQlVhc1NMOVZSOGFpMFV6d3RJdE5uZ2IweTNyUjR5?=
 =?utf-8?B?Z0RnUUttdjdScEdpa1lzRDVucHBqSzdJYXZFTjFMU1MrbkNqN1k2dnNSTnFz?=
 =?utf-8?B?bWU4aWhZZjRLekkwR0c4K285ZGllc2ZYSDlEMHYrSUphdTZ2V2xEUlFISENY?=
 =?utf-8?B?VGJaNk5BQUNvWTh4d1FpYll0MGM4cG9FcjBEWFBackpaY1J6MCtPM1FuckZR?=
 =?utf-8?B?dzNIUXY5Y0ZjT1hxUGthdzFZYTdlMXE1dU00SzdhQjg0VkxCWkdOc3BxS3FW?=
 =?utf-8?B?Zi9RdENDVEVhZHpGUjdQcDJLVnZCSkRKZytmRUFQZFRpWFp3d3dVZ3V4aEhR?=
 =?utf-8?B?VVFHZm9YTFYvckZybXVRNXFoZ3NpV2tzZGpuUGNoU01TVzlPMCtQOXZNZXYw?=
 =?utf-8?B?dGY5UDk0SlFVdW9mSzVQMTQ5SDl6c0ZZSzVYSjUrbHkzUnhxRWxxL1ZnUDlU?=
 =?utf-8?B?VVBsaXVaMnBVa3BYOEFhd0tKb2g0NmgyM2R4S0ZyZ0N3T0FxYzhwdVgrTGV5?=
 =?utf-8?B?aHh5Y2tvSEZLQmhQOTM4TmI3SGk3V3VHaUpQa2o4cTdWdmZldzhIa0pBOEZO?=
 =?utf-8?B?MTJoekNGMUJaTFdrR0NMR0hNcUhFNmc3eTBaR0xTR1ppY0x6SE5LZk93eGw2?=
 =?utf-8?B?aDhKeSthRDVSa0ZTOTlZMVJjUHVpdnBpcTl1Wjgrdml5ditxWVg3MGw0d2lI?=
 =?utf-8?B?QmR5SndVaDl3cUxrOENQKzIvSTRzaUlCWEVzS2RGclBmejZRNWEycldmZjBa?=
 =?utf-8?B?SEpFdkVDSTlQSFd1aTVEd0pTSmhkZ0VuNDNiOEdCM3oyd1pOV0lpMDJOQlZY?=
 =?utf-8?B?ZG45QVk1aEhpWVUySFFvV2U4V2R6L0JpMEUrQnNwbkN5WnJUci84V2RYKzBI?=
 =?utf-8?B?MWh0UjBVRFp4SURmWG1JV0ZjVVN2TXFHL3RzUUtJQk1HOEFSM3VEQ05JLzdP?=
 =?utf-8?B?dHRxTG9hTlVaY003WHUyOUhDeWtyNytnd1QxRlpjK2JsNThxbmpvdjk4Vnk3?=
 =?utf-8?B?TFltdW56aGJZVjEzc05NQWtwRHJlTktWU2RFSTR1elVyOXg3NXQxL2l5T2dE?=
 =?utf-8?B?dHA5a29lc3lVNm82RG8zU3VkeWtiTHFvQmdvLzVlREU2YzZabWtXaFV0QzhK?=
 =?utf-8?B?SmJ6VFVQMThFcHJrZFVQMVRsWHVNdXQxdGl3T2pqRm9nNURIVXVHQStab2VX?=
 =?utf-8?B?RVg2TDJhL3NYUHVnU0ZzR2V1cTJrUGo0Q3dFeXBFV0w1MWx2WWNhU0MwRnB3?=
 =?utf-8?B?OVppSklGc3NldlBxTlNiTEx2bUZTeUZIUElMV2NXTk0rYzZjdXVvOW1GRU8z?=
 =?utf-8?B?Ykl2YXMwRDRjQW9SV2pRNDNRWjZmWC9GM0FRNS9uL2xPV29ibW5RMDJEU1Vn?=
 =?utf-8?B?TThaMCtRTCtVeUpYRGJTdWpqUGl1QzRWNDQvS1AxREswdTgvT1I5NXRXMGJw?=
 =?utf-8?B?OFB2U2NUclpCL0VBSFB3d1ZXd1ErRlkwZ1liYW8yOGs5M2Q4QytLbEhWN2JN?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db61ce0-6869-4f36-95d4-08dc3c275b66
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 08:44:51.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isNdyyKGOdhEuCIXHclFhf5ipKo3dmPeAUdNBAFfsLjAlJZtKC52QY/WaFEEu8h/Ilh0gnycbayR4oMRU9BuUXWPODBbShXgq/IeE2d1ngM=
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
> index 266826eac4a7..f2fabb673aa4 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2948,6 +2948,31 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
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
> index a62fcd051d4d..7df19acdc790 100644
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
