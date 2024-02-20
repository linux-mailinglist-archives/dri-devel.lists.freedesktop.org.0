Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8885B293
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 07:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E660A10E141;
	Tue, 20 Feb 2024 06:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsoeDJg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6C10E04E;
 Tue, 20 Feb 2024 06:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708408962; x=1739944962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rz4UxG0YrAs3NQGbdy5kaw/dgtKsDDu/8kJhVN+FZXo=;
 b=ZsoeDJg97bQr/rWv5g3UAkxRkfVuY691pzgXkVc9YWVj9yLDPrnyDIG/
 97YzBMIFrb+FO585/D7UEYFRRv9TGP3rwFllE9i4CtXsqqg7UcohSzg6U
 NLMVWwWoBM5ZM51jEcIyMs86LGpDfpJRSz72MRm2s6ac1ThEwWRSxMb0d
 RNOxDk4GPQwBK0tDoCZcellD6HxWboYYl2O7aONyWtwBGsPyqXkmJLPEg
 glGAPSr66Ihz+mdMH9zK7b4RBZ44XRH4vUgjHb4IZ5RXJM+fUr6JJZAXl
 REsQKR9khSdQI+Qj3ctzJ1n8/1JKElvklkyjIp8UohaCH6V5oX7Yt0iDf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13897629"
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; d="scan'208";a="13897629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 22:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,171,1705392000"; 
   d="scan'208";a="4830688"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 22:02:40 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 22:02:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 22:02:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 22:02:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMvAbdmhzq/wRceTbOwnFQR5mlwvKEHLz7v6Lq9s4syMEALcLbQlaR+U/+IK+ytrsNGtAQIF5kXsNCcebKXBaKkLmJIPIyWbXJW03oM8vUkfbXnzzRDjrU1JZPq31Ki7YEm1VrILiXuP9lFoio4UptqC31DybpSZDa7VKbCUX9v4pTV+ErN/RwLGeKfs0d/WjvQiQfRn6tJ5TUUGpgqBIase7gjpnOyCHhI8Uf/cMAbO1kykK4SUjEyuroT8W2Cv8eOa8aF61dggjS/PvDBv6SYFeaAx4DqUyYbEaaAOP6iq2JgbvQZB3q2PnWEaSfInFk1kfmS+uNrMy6UfBrePpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDGyOhh7OzVeXcD6JYF8kQsJ4k9PACHuHe3qwFeM+9U=;
 b=nNOjYL8mE5jQ+qhv0p257WhJsKEXldOMhCRNRqwQEN+g9SBQWfcFoa8p6iQf+dC6RkD8q9y3dSRfpx/zmfioFOl5ZXri28iMYVOlb8ZTGvVX4U/h4kkc/czcTZfNwq2zkgBLY9sTdwdx8c/wYQhpB2bbSrGLQcE84i5XSfGHKcTBvayfuNcZ46um4vtLtMikbUOZUpu7orFsg2ofbdvpvW3T0H4KRnEY/726QCzgLATvwfVs3Fo7/JRX/BlCHWNgrWApPhLu2BVYgfrHsDHEsF24hwAc7H5w8XAxwvHNXPPXy44hEjefF9aMxrm1EXm9Vqen+nkQYqLuEkscZYd7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5584.namprd11.prod.outlook.com (2603:10b6:a03:3ba::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 06:02:37 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 06:02:37 +0000
Message-ID: <6fe6bc0f-7931-41ca-b3d3-6b4a48099a49@intel.com>
Date: Tue, 20 Feb 2024 11:32:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/dp: Add Read/Write support for Adaptive Sync
 SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240216142024.1884258-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240216142024.1884258-4-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240216142024.1884258-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae775a7-1eb5-467b-5b45-08dc31d98a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C3XHdv738uxD0i0w68iahOioocwa/na8V9JIaoGJ5RdUYNqlBjzVEXKd/Rfdj9Z9/wPwd+t7NFSxfs4IrJSZadgdLy2yN+HzHwvvw8rfJSrWS3Dn34kX0lGRvo/z138kfCkNIcdrqqBgHbEg0UP7gwqswfRBQNl5hrAjFOAYIETWZ1t+v19eZq161Kp6Ox3XlBM7BFvuHTgsB13/fgfsLPIo5H36LvlGXLCrxB5GG5tTC3IfuywCZ7kpM/Sbl5valoa0zoFsKQ5EWXZL8fwPpmoedCkul5HJHBJVqtlP0hPfpm8qqRq1sZhSZAz5M4zDaGlbo7BPX9pWHN3MRGisc7TOI/HDJNFUIJgo5p+DFLO6NCfDRdK5P77I8JPaherNg86n9uc0Juc0uj6HjtWvfYIzAXp0pC+g2HmI1o1Xp8tXp7jlHNG7fITboTY4qFweCbWva/5F7wz8thzmaOedm/PK95LEzcZ9f7V25jH4yGBizuuGJQxt0S2bM6ZwaqQC6NsCI5VXmovquxV2unt5piapylpSrM9tIAE7SvqdPD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEY1cmwwczFVYWYwRHI4bGZlMlRSZUZlazRjTm40Y2dFN29VaHpLMDNGc3dy?=
 =?utf-8?B?UXhmemp5MjcyNWFDSzQ4b0dUWW5IQlNZWC85R1VJUWZDd2lma0JpUTZEcTBq?=
 =?utf-8?B?WFE2eGVSQ3B5YmdmWjd3cTR2SXRES1hoZFZ1alFwQ2hXZTRkQ2xFcEtzdFl3?=
 =?utf-8?B?VlpWNTJNQUhVZS9wYjAzd0FsMDdmaFdSSk0rY1EzMXZaOCtKRWlIdnByNjhT?=
 =?utf-8?B?RDJmQ0NsUmVwWUpyZDdMb3cvUkttd0ZVUkNGU2xGZlBPckJxOXZVZHJjWVNv?=
 =?utf-8?B?bzVTYUZaREFzWm5jbGRmemVqL2M1R2V2WmlVdDlWbGQ3REtLZ09QSERPaERx?=
 =?utf-8?B?ODN3dzkzV2YxbVRlSHp1NTE3N1dIMmp6aGtjajZkdXREYmRubWtTWWpqalJL?=
 =?utf-8?B?M3NlTGppTE9kUUJBZmZzSGgvNnp5eEt6T1h4c1BkT0xkay9PSXpwVElMSE5R?=
 =?utf-8?B?MUIwWnJpaE9uUnAxRmpOc0QxUHV6QzJWVDh2NU82bFMveU5uUzFlck5KWkY0?=
 =?utf-8?B?OWo1WExzcXVhRmNGNGs5WmQ2YnloNm1pZ2phSDFkVUlZbXRMN0hCaitEYnRE?=
 =?utf-8?B?RnVFWFAxK1dIeXlQd1FFb0IzVW1LS0ZtNThxNmFFU1RPdzhJdTMybFhkZ2pN?=
 =?utf-8?B?aktPNjczUW9ucXhxU2U3QU1xc2xiWWFVbjNNOXNra3ZFeW5TVHBYa1hobWc0?=
 =?utf-8?B?eXJXWTQzU3MvZW8zTHRNQ2xWMEUvL2xsSkZPOXdiVmxFdlBNZko4V2NmQVZ5?=
 =?utf-8?B?TTVJejBTSU5qbWUwY1ptcUFEWDB5clBrdFczUEJSQjRzSno2enhNdkRMeXhK?=
 =?utf-8?B?MlZvUFlGazI3SnhEUFVaUUVheHErYTRwaHhDVFlQRzBOUE11aElkdkdzNGNr?=
 =?utf-8?B?QWRJRWYxcHhUUkJ4NnpiUHV3bk9IWFdSb2RwUzl1VG9WRmIyVStISDhKVXl5?=
 =?utf-8?B?cTlkbDBaY1MxVTBqWUk1YTFEbDhFNnRkdW9FdlFNNkVubEZld3NDSEg1Qkly?=
 =?utf-8?B?eGNlR2dDRG1lTTg0bWlQQU1lM1l4THFuMERvakVWK0tJV29taURwUTUvYXk3?=
 =?utf-8?B?TktuR21tN1dubGtoWmx4QWFMbmlSenpUNjk2VVdPYkhCU2F5U0ZqWDh0RjNm?=
 =?utf-8?B?SDB0aEkrNVhlTXRJNmFDUHVlQXZhYUV3UlZ6cEFLWU10aDdJUkNsdDMzUGdE?=
 =?utf-8?B?cFhWNDRWMjhCWWFlcHI3Y01QcDlRWkQvZE1CbE14Tzd0eThSWVZKV0dMRWQw?=
 =?utf-8?B?RzI2a29MRFNUWVFmT2x5aXQxeDNvcWYxajJEa2JYYUdmSXVySUFXajN6cXpN?=
 =?utf-8?B?U2VPTEYyckpMMkVJVzdwMzJzYUMvWTBmZEpBQlZUU3hGN2xmVnNNbjdKWU9P?=
 =?utf-8?B?SFp6Y2pjeXNjZHQwSWp1YlBLd0thbXU5endJS2pIbCsxNExXYzFFSXE3VDcz?=
 =?utf-8?B?bmlpVVhMWnpyMnhhMXRZUnpKQVBNdjBFRHEzNm5TdXdhOTRCUU9nQjNPWHlt?=
 =?utf-8?B?Wm5Cb3VLTEt3elVqVjF0eXBtM0huZ3A4U2tsSnNVRmYyUStTb3I2cGdVakNs?=
 =?utf-8?B?bWtZdElWSC9YUGl4TFlEcnE4c3crUUpKdjc2bjRPa0lKNTBiaWVuTTBUNVJU?=
 =?utf-8?B?TUU5Ym4xU2VBTkFIOTFBSWoxZSsrbVZ2VDBBdHhZSExHUnF0Q09pdUxaVWpD?=
 =?utf-8?B?aTFTZWw3bm5GZVlmL2lYaCtQc0JXQVpRWmR3encrWTV0eXhzQmc0VHd6QmpU?=
 =?utf-8?B?M3lTeXBRQ2p1VDNJUSt5bUt6ZUhYazZRTks5RlVkeEVZZGVjZUZ0MjJoazRE?=
 =?utf-8?B?WjFvYXJKMzJ2cWdWbW1aRDRhQy81NWQrM203QVNQOU9jZFNGUHBhY0xFQVFN?=
 =?utf-8?B?dlNXSjY3dXcvTkZDNUVROXlCc2Y0QWpFMXo4QWs5eFJPZG5zVVZSOVdtanpX?=
 =?utf-8?B?U0hwQVIrZThINUhoVjA1b1pMRW55SzlJZlN1WTE1M3Qvdkp1SVJLMVpVNGll?=
 =?utf-8?B?YiswbUlkSk56NXdZZ1dacURLSC9saFViZUliSTJYNWthQ2svdjg0MlM1QjNP?=
 =?utf-8?B?Q01DNHZqT1BBNFZ1QkIrRStBdTJMUFBxMGU2WitLNTZNZ0JhOWtqL2VucGJi?=
 =?utf-8?B?RW44UDRNelk1ME5LckJ4a05udS9pUWoydDZTOXlYaXZJN3lOL3o4YUhBQUxB?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ae775a7-1eb5-467b-5b45-08dc31d98a24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:02:37.8273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDag4f20F/eFuc45EOgQiRGscy/UwybJOZ3DveDKyUdqmVzXEqdt7OkQVlZyhmMtSJU8NREGNIYSUVUzNgAhYu5I36mKG6eCJChXb741kdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5584
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
> Add the necessary structures and functions to handle reading and
> unpacking Adaptive Sync Secondary Data Packets. Also add support
> to write and pack AS SDP.
>
> --v2:
> - Correct use of REG_BIT and REG_GENMASK. [Jani]
> - Use as_sdp instead of async. [Jani]
> - Remove unrelated comments and changes. [Jani]
> - Correct code indent. [Jani]
>
> --v3:
> - Update definition names for AS SDP which are starting from
> HSW, as these defines are applicable for ADLP+.(Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c   | 95 ++++++++++++++++++++++-
>   drivers/gpu/drm/i915/display/intel_hdmi.c | 12 ++-
>   drivers/gpu/drm/i915/i915_reg.h           |  8 ++
>   include/drm/display/drm_dp.h              |  2 +-
>   include/drm/display/drm_dp_helper.h       |  2 +
>   5 files changed, 114 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 217196196e50..d68fb9d45054 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -95,7 +95,6 @@
>   #define INTEL_DP_RESOLUTION_STANDARD	(2 << INTEL_DP_RESOLUTION_SHIFT_MASK)
>   #define INTEL_DP_RESOLUTION_FAILSAFE	(3 << INTEL_DP_RESOLUTION_SHIFT_MASK)
>   
> -
>   /* Constants for DP DSC configurations */
>   static const u8 valid_dsc_bpp[] = {6, 8, 10, 12, 15};
>   
> @@ -4089,6 +4088,34 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>   	return false;
>   }
>   
> +static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
> +				    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/* Prepare AS (Adaptive Sync) SDP Header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = as_sdp->sdp_type;
> +	sdp->sdp_header.HB2 = 0x02;
> +	sdp->sdp_header.HB3 = as_sdp->length;
> +
> +	/* Fill AS (Adaptive Sync) SDP Payload */
> +	sdp->db[1] = 0x0;


Operation_mode, target_rr etc should be filled from as_sdp struct.


> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xF;
> +	sdp->db[3] = 0x0;
> +	sdp->db[4] = 0x0;
> +	sdp->db[7] = 0x0;
> +	sdp->db[8] = 0x0;
> +
> +	return length;
> +}
> +
>   static ssize_t intel_dp_vsc_sdp_pack(const struct drm_dp_vsc_sdp *vsc,
>   				     struct dp_sdp *sdp, size_t size)
>   {
> @@ -4256,6 +4283,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>   							       &crtc_state->infoframes.drm.drm,
>   							       &sdp, sizeof(sdp));
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
> +					   sizeof(sdp));
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		return;
> @@ -4276,7 +4307,8 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	i915_reg_t reg = HSW_TVIDEO_DIP_CTL(crtc_state->cpu_transcoder);
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
> -			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK |
> +			 VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4298,6 +4330,40 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> +static
> +int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
> +			   const void *buffer, size_t size)
> +{
> +	const struct dp_sdp *sdp = buffer;
> +
> +	if (size < sizeof(struct dp_sdp))
> +		return -EINVAL;
> +
> +	memset(as_sdp, 0, sizeof(*as_sdp));
> +
> +	if (sdp->sdp_header.HB0 != 0)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB2 != 0x02)
> +		return -EINVAL;
> +
> +	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
> +		return -EINVAL;
> +
> +	if ((sdp->db[0] & AS_SDP_OP_MODE) != 0x0)
> +		return -EINVAL;

lets not check this thing here, but fill as_sdp->operation_mode, read 
from the sdp.

Checking should be done in intel_pipe_config_compare, perhaps need to 
add a new PIPE_CONF_CHECK_ for adaptive sync SDP.


> +
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];
> +	as_sdp->target_rr = 0;
> +	as_sdp->duration_incr_ms = 0;
> +	as_sdp->duration_decr_ms = 0;
> +

I think this should be filled from the sdp.


> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4368,6 +4434,27 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static int
> +intel_read_dp_metadata_infoframe_as_sdp(struct intel_encoder *encoder,
> +					struct intel_crtc_state *crtc_state,
> +					struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +
> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +
> +	return ret;
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4474,6 +4561,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_metadata_infoframe_as_sdp(encoder, crtc_state,
> +							&crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 7020e5806109..69e0876f43aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -137,6 +137,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +166,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +190,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -558,7 +564,8 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   
>   	mask = (VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
> -		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW);
> +		VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> +		VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
>   
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
> @@ -570,6 +577,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1220,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_ADAPTIVE_SYNC);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..c02ea07af4c2 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2312,6 +2312,7 @@
>    * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
>    * of the infoframe structure specified by CEA-861. */
>   #define   VIDEO_DIP_DATA_SIZE	32
> +#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
>   #define   VIDEO_DIP_GMP_DATA_SIZE	36
>   #define   VIDEO_DIP_VSC_DATA_SIZE	36
>   #define   VIDEO_DIP_PPS_DATA_SIZE	132
> @@ -2350,6 +2351,8 @@
>   #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
>   #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
>   #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
> +/* ADL and later: */
> +#define   VIDEO_DIP_ENABLE_ADAPTIVE_SYNC	REG_BIT(23)
>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_VIDEO_DIP_AS_SDP_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define	_VIDEO_DIP_AS_SDP_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _VIDEO_DIP_AS_SDP_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index af6790fb4791..6f4a3e95906c 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -1578,7 +1578,7 @@ enum drm_dp_phy {
>   #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
>   #define DP_SDP_ISRC			0x06 /* DP 1.2 */
>   #define DP_SDP_VSC			0x07 /* DP 1.2 */
> -#define DP_SDP_ADAPTIVE_SYNC    0x22 /* DP 1.4 */
> +#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */

This change should be part of previous patch.


>   #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
>   #define DP_SDP_PPS			0x10 /* DP 1.4 */
>   #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 8a692a86d8d6..a4e0b18bba3a 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -839,6 +839,8 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
>   #define DRM_DP_BW_OVERHEAD_FEC		BIT(3)
>   #define DRM_DP_BW_OVERHEAD_DSC		BIT(4)
>   
> +#define AS_SDP_OP_MODE				GENMASK(1, 0)


This change also should be part of previous patch.


Regards,

Ankit


> +
>   int drm_dp_bw_overhead(int lane_count, int hactive,
>   		       int dsc_slice_count,
>   		       int bpp_x16, unsigned long flags);
