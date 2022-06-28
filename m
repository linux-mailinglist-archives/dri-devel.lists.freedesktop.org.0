Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4E55EFA6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFA311228F;
	Tue, 28 Jun 2022 20:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126311228F;
 Tue, 28 Jun 2022 20:32:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aKhIVQSRMAZtku0aadNpSnIy921Wu6SSwJjAfXYFdesYZnLEhk/94KLjWX73eFpbucBpSEPruCFe43DN/RWw8vXI/m3ip+oKfvAn0E3SuG0hWIoEljlMaJ5xiQz7PTI4SSgldYYe9z+B1l0A8RPA9t+yVlE7yYlLJbFO0acTDFQfEUqlDxhugq0gVU9wxUt7xTlzBZzQjpSXhjA3VCLP4+kx/AuDGkTPqi1KwRrwMh/XSA952VCLj8sL+kKhGyAElRop6ReKRQfhpUVaOQHxeEoddxLuvVYZSuOfeMQYf67q6k3tencLYeytyLKZ6hCAIlDEDqDR7zl8pbGXE1Z7fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GTzf73ALxtrNhlnYmTMDD8giF1MhEiUU1b4RxcvoIw=;
 b=ECNC+YHR0w3YQeIhboEtyqzHCk/2IYeGIYd+WMne8TgVYK54N7bVvTS7HWeE4u13M3WSp38MQMaYYWeVIDxC16s3K04EM0FTDUT59o/c7bxj7LN27QNya11BvTod2Ee82OQOcEVTWs2wJxPguQA7yfgBPM4powJojoB5uaYnfPJwP2NgRI291x1qtP/dfffUnt29Vs3utHflz28BXiPXEQ5vNtPQMjj5SH0qAz0KlniT/U6KIRZiOHuWfnRYN01s7pzhlSudI+sObmSdM5GSzMegRU4t8314jcP3DJF9FjQaby0fKrQSgxQbeKMqE5M52LpRCa/J0wpq83CncHdQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GTzf73ALxtrNhlnYmTMDD8giF1MhEiUU1b4RxcvoIw=;
 b=T/QB96UBmJfZ5gcenZzfBihJAQIcCy55iBqW02gUBszK30ZDMx2wPkc8jrBjoAlPKtNbnR4ntmaB0RAmWTAk+/9PRqSzi6VBp4Sxq6YqXEa8CPtLpGWBhpcuNeXOvzXHGauc1vsGrPLfPE3/FAq2LZzS0B/ny9/SinG6Vn3AjYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW2PR12MB2378.namprd12.prod.outlook.com (2603:10b6:907:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 20:32:15 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f55b:be13:11c6:d9dc%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 20:32:15 +0000
Message-ID: <61be1840-5301-eda2-7c93-bc3b9486cf4f@amd.com>
Date: Tue, 28 Jun 2022 16:32:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/5] Documentation/amdgpu_dm: Add DM color correction
 documentation
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
References: <20220619223104.667413-1-mwen@igalia.com>
 <20220619223104.667413-2-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220619223104.667413-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ab17d4a-430d-4262-6a31-08da594549c2
X-MS-TrafficTypeDiagnostic: MW2PR12MB2378:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBtzhXtTWP6By9QGxw5C/ZU5UWuzoZYShKEA/U4ez9rU/Rp/3lvwYWjwzDCZSPd6IO1+BlHZMuTDDK9ATS75qllmX6RAqLZHE/2fNcx1VMMSFW9zB+3PGhdHXIG5jBT298rvjqFMRFc0+YIHnEX9yEDBkg2WVobSWPRqJsC77c94pK0TmsjDZEG6te1gF2Vh/qP954IsnUdd0LbGfLPt0dBKLeePLKrcgm6UCNtKYg0AzNufb/cxGSL6tAsAOpAvMl8mMDiyyyAX6pT8cUXRn4yMolUyO3K7dF5GyKk8fur6PkLfDBRh6NUubk1BeNQXGENwr/PK5TtiQacna1WEgIb5ytTuDUyopZUzSuLRXoyNjbfDyeLH+7lrlkjzm2h5hiEuSnLufUliLNxmUAd4mG6q9e73ISrvuQsadYFwcnUBSBk0FmgxwZwNjiV/IGqhitK8kGSISurGA0J2VRRWryBW1nlJmXVQ+QfOryCUPDCQRP/rtoLg7ka1KUrfW9qmDy05HnKsakZFVb6/LJeFPLpB86DMTiZewbXxPqHL/n3kYZy6VEM+rkXIO7V+gjehRTApCiy/zCEv82lOtb2lSPOUjTL7e7/SmjkAcKsz/E1ERvhiXGLmoGNVr4gdiGw5zLEAr0IVcK4MWVwqNo1ZeUwLkksqmN/oY5roCxxe40zgJqj584+YS8ZQjKyeiVYdlxleq1rhK3bhRzxc3xIMrQEZLlGzB1L+8WYiWAZEZHnYGWLGuCDVWyKjiLPs3LrDMHRLSSN937iWWwiGjJUJYXc1ymWDEE/C12rZP2PxbA+0magi3hH969A3Bf6qWJ+vuOpDZnSrjgpntAo/HIsWyzIK4UNxjl0twbE11oaUoR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(5660300002)(66476007)(6486002)(478600001)(2616005)(186003)(31686004)(31696002)(921005)(6666004)(41300700001)(83380400001)(36756003)(8936002)(26005)(316002)(4326008)(53546011)(86362001)(6636002)(44832011)(66556008)(6506007)(38100700002)(66946007)(30864003)(2906002)(6512007)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRmY2ZvU2ZBREpVS3ZidzJ5V2UzUkcxRVdsUjF1VVczWGNjSFhZQmhHTURq?=
 =?utf-8?B?dnA5MHpLRHdmVXo4TVFFRWUrR0Z3b1RqdEtIMnp6QytVUFZLanA0STN1dVZv?=
 =?utf-8?B?bC9qRkFNS3cycEZ0anpaTFpBVnBoUC9BOTFiMWVvQWMyM2M3cjFPYW1aMFJs?=
 =?utf-8?B?QTFEZldZcGlhVzMwa05kaW1IUVdrMDZYc1BleWR1bXU5dnc5Z05WeEZXTlNS?=
 =?utf-8?B?cWVTajdHQUxjZU1uWFN0QzJLWGNCczErQVRNdjRrOURaczJLcFNYdVVYL2Rw?=
 =?utf-8?B?eEpEQkhQQmM4Ylhqam94Qm1XNUJIUDVLMlAxNFJKd3VIYWIvMXlZZVZ4UUwv?=
 =?utf-8?B?eDkyOUNBWW1CUVFIT2JOU0JndjAzMHp3dVhlVkdJQ0pDSmwwTHBLcVprZDBX?=
 =?utf-8?B?OVhzRnFNTS9FQ21hbVErREdjNWNkbXRtcmNVU014NUp5L2N3SFNZRWUwcUFw?=
 =?utf-8?B?cTFJZkhKRld2Sk1UKytTRjh0VW9YbUwvRnRubEcxK2FMVU10MEVzbXk2UHpZ?=
 =?utf-8?B?VHhJcHg2R3lmMFB2UVNwWWFxZ0NFa1VSN0d4QndoS3pDVUpvQzFHa2cxdnhZ?=
 =?utf-8?B?VnRScTJCNXFCeUVNSUpZYjBsOHZqbGZTVzAxR0JLNHRONXI0MVFPbXhUT3hy?=
 =?utf-8?B?Ykx1Z2krdDJ2eEkvVHdmWWtmTjI0UklYN0NPc21vMFc5UU9UN1QzUXJUY085?=
 =?utf-8?B?ZFNGdFQ4SS8rOXl3NmxyYXJRUWd5YjhFKy9DMUFPaWs4Qy94VE1WbnduVmNZ?=
 =?utf-8?B?UHRERTdBRXFNTTQ4VWk2ZXZLdmJ0RHFaV2RpTDRGdVF2SDhvQzkwN3hWSk9H?=
 =?utf-8?B?NHZMeDJVaDYrV211RVUwVXUxZ3lHNkU3alJuV3JLSVNYcU9oN1RwOTJSbnIr?=
 =?utf-8?B?aHpkNC9nazJnR29VeW92UUphbyt2Zis1WjJ5THZ1MUZrMVkxd0RrZUdKckZ5?=
 =?utf-8?B?KzdaK0tDZFlYQklUVzBLcjlRWTMyWTFFVnpNQ0JZUjMyY3lrUDVFWVhmdVEv?=
 =?utf-8?B?RXBqdC9iMUdzektBWk1vbzVmbkxXZ25CYnF0SGlTNWdvQm90OVFDQk1LbHo5?=
 =?utf-8?B?WE9TaWxhbytDdmxPNStHNlVnZVo2aFlOZ3lXTEtDTFJhTzZCL3ZRbWhzN0hE?=
 =?utf-8?B?VU1zQy9XTURWSlRhMUE1SEtYWjJVSHYvMk9xWmNQRCs2SmxTMWNsRHhnUVRo?=
 =?utf-8?B?VFMxY05yd0VwUVBqYnZadTg1MzMvT2RHenVLdFRyQkt0alE4ZGJ2c0dXamZr?=
 =?utf-8?B?b0htbHdoVFhMeEpwaHl2d3BWMGtQclE0aU1mdGVLRGZvUktEY0QrTFpFWU5k?=
 =?utf-8?B?UzFWTjNSNHVrMjJZZkZHWGMzZTJabm9DOHhIYTFTR3ArODV4eGM4Wm5CUlJq?=
 =?utf-8?B?ekJON25VMnZ6SGdDM284MU1mQTBDTHFJSFFmWm96VE9WSTFCLytLUGVDSnVl?=
 =?utf-8?B?QVR5eThtdXBhYnhuTmtRQ2ZWaU13UGlVRUlCSW9JV09mZEdEeTBCeHJ4TkFX?=
 =?utf-8?B?bHJQeDlFTWkwVkZDZ3hWM0dKOUxGNVBaOVEyWGVWaWFNZWlTYWVTNThxb21h?=
 =?utf-8?B?U2xKLzd6LytXcnp4VWRyMUg5UFViNnowMnNWVGdmQlBZbEdZdWFwTW5yOTdx?=
 =?utf-8?B?QW5SZGFHald2OUFSalQ5Y25qVjlSY0hYMXFYZXMxcGZvRzNudWVranFxVVQr?=
 =?utf-8?B?a05ERHI4UUNEazRNZUhnY0c5YU5KbHB6ZUt1b0dLdGRROXIwRFF2S0EwWTYw?=
 =?utf-8?B?Z3lKcHRGVWpuME1YenBRekhTUm1QTnNkUzZkdUFUdjVBR3JOZ0VtK3NCMG81?=
 =?utf-8?B?eE9SUkpQMkFZWEV0RlNuY25wcFVlMm9URGZkNjZjNHgxQ3Z5ZjhuT0tndjI0?=
 =?utf-8?B?VU1TRDZ2UDF4d0I3OUNWdUtKL09qUmxNL2k5dC9TcXlnNHVROEMwb3huOTI1?=
 =?utf-8?B?MVRoSy9mcVBHalhmbUVHY01STjBYcGg1UWhvaEtmS3VVWWJHY1hKbVR4cGZo?=
 =?utf-8?B?eGdPTjJJbTRyemx5d2ZsTDdENnMrbXNicEd6YVZ1QjBqeDVhM01PYnJiQ1Rk?=
 =?utf-8?B?YmQ3Q0dwSnJkTEJ6MFFUQWNtOHd4Sm5WQzZhMDB0SG5GYnpxaXVSUTBucXZM?=
 =?utf-8?Q?xxTdCzgo+OXVI72D+qVwXEOsL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab17d4a-430d-4262-6a31-08da594549c2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 20:32:15.3314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YSR9rGIH4gbuD3qZby0Wc/I8U1FJmEbH0aRZY5EQxMQ4UufrpHovoHIeEYTm17bVGutyGI1k8Iu4do8nsNWug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2378
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
Cc: alex.hung@amd.com, amd-gfx@lists.freedesktop.org, nikola.cornij@amd.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-06-19 18:31, Melissa Wen wrote:
> AMDGPU DM maps DRM color management properties (degamma, ctm and gamma)
> to DC color correction entities. Part of this mapping is already
> documented as code comments and can be converted as kernel docs.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/amdgpu/display/display-manager.rst    |   9 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 122 +++++++++++++-----
>  3 files changed, 101 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
> index 7ce31f89d9a0..b1b0f11aed83 100644
> --- a/Documentation/gpu/amdgpu/display/display-manager.rst
> +++ b/Documentation/gpu/amdgpu/display/display-manager.rst
> @@ -40,3 +40,12 @@ Atomic Implementation
>  
>  .. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>     :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> +
> +Color Management Properties
> +===========================
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +   :internal:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 3cc5c15303e6..8fd1be7f2583 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -242,6 +242,8 @@ struct hpd_rx_irq_offload_work {
>   * @force_timing_sync: set via debugfs. When set, indicates that all connected
>   *		       displays will be forced to synchronize.
>   * @dmcub_trace_event_en: enable dmcub trace events
> + * @num_of_edps: dumber of embedded Display Ports

/s/dumber/number

Thanks for turning these into kerneldocs. With the above minor nit fixed this is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> + * @disable_hpd_irq: disable Hot Plug Detect handling
>   */
>  struct amdgpu_display_manager {
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index a71177305bcd..1f4a7c908587 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -29,7 +29,9 @@
>  #include "modules/color/color_gamma.h"
>  #include "basics/conversion.h"
>  
> -/*
> +/**
> + * DOC: overview
> + *
>   * The DC interface to HW gives us the following color management blocks
>   * per pipe (surface):
>   *
> @@ -71,8 +73,8 @@
>  
>  #define MAX_DRM_LUT_VALUE 0xFFFF
>  
> -/*
> - * Initialize the color module.
> +/**
> + * amdgpu_dm_init_color_mod - Initialize the color module.
>   *
>   * We're not using the full color module, only certain components.
>   * Only call setup functions for components that we need.
> @@ -82,7 +84,14 @@ void amdgpu_dm_init_color_mod(void)
>  	setup_x_points_distribution();
>  }
>  
> -/* Extracts the DRM lut and lut size from a blob. */
> +/**
> + * __extract_blob_lut - Extracts the DRM lut and lut size from a blob.
> + * @blob: DRM color mgmt property blob
> + * @size: lut size
> + *
> + * Returns:
> + * DRM LUT or NULL
> + */
>  static const struct drm_color_lut *
>  __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>  {
> @@ -90,13 +99,18 @@ __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
>  	return blob ? (struct drm_color_lut *)blob->data : NULL;
>  }
>  
> -/*
> - * Return true if the given lut is a linear mapping of values, i.e. it acts
> - * like a bypass LUT.
> +/**
> + * __is_lut_linear - check if the given lut is a linear mapping of values
> + * @lut: given lut to check values
> + * @size: lut size
>   *
>   * It is considered linear if the lut represents:
> - * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in
> - *                                           [0, MAX_COLOR_LUT_ENTRIES)
> + * f(a) = (0xFF00/MAX_COLOR_LUT_ENTRIES-1)a; for integer a in [0,
> + * MAX_COLOR_LUT_ENTRIES)
> + *
> + * Returns:
> + * True if the given lut is a linear mapping of values, i.e. it acts like a
> + * bypass LUT. Otherwise, false.
>   */
>  static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>  {
> @@ -119,9 +133,13 @@ static bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
>  	return true;
>  }
>  
> -/*
> - * Convert the drm_color_lut to dc_gamma. The conversion depends on the size
> - * of the lut - whether or not it's legacy.
> +/**
> + * __drm_lut_to_dc_gamma - convert the drm_color_lut to dc_gamma.
> + * @lut: DRM lookup table for color conversion
> + * @gamma: DC gamma to set entries
> + * @is_legacy: legacy or atomic gamma
> + *
> + * The conversion depends on the size of the lut - whether or not it's legacy.
>   */
>  static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>  				  struct dc_gamma *gamma, bool is_legacy)
> @@ -154,8 +172,11 @@ static void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
>  	}
>  }
>  
> -/*
> - * Converts a DRM CTM to a DC CSC float matrix.
> +/**
> + * __drm_ctm_to_dc_matrix - converts a DRM CTM to a DC CSC float matrix
> + * @ctm: DRM color transformation matrix
> + * @matrix: DC CSC float matrix
> + *
>   * The matrix needs to be a 3x4 (12 entry) matrix.
>   */
>  static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
> @@ -189,7 +210,18 @@ static void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
>  	}
>  }
>  
> -/* Calculates the legacy transfer function - only for sRGB input space. */
> +/**
> + * __set_legacy_tf - Calculates the legacy transfer function
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Only for sRGB input space
> + *
> + * Returns:
> + * 0 in case of sucess, -ENOMEM if fails
> + */
>  static int __set_legacy_tf(struct dc_transfer_func *func,
>  			   const struct drm_color_lut *lut, uint32_t lut_size,
>  			   bool has_rom)
> @@ -218,7 +250,16 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> -/* Calculates the output transfer function based on expected input space. */
> +/**
> + * __set_output_tf - calculates the output transfer function based on expected input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut
> + * @has_rom: if ROM can be used for hardcoded curve
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>  static int __set_output_tf(struct dc_transfer_func *func,
>  			   const struct drm_color_lut *lut, uint32_t lut_size,
>  			   bool has_rom)
> @@ -239,7 +280,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
>  	__drm_lut_to_dc_gamma(lut, gamma, false);
>  
>  	if (func->tf == TRANSFER_FUNCTION_LINEAR) {
> -		/*
> +		/**
>  		 * Color module doesn't like calculating regamma params
>  		 * on top of a linear input. But degamma params can be used
>  		 * instead to simulate this.
> @@ -262,7 +303,16 @@ static int __set_output_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> -/* Caculates the input transfer function based on expected input space. */
> +/**
> + * __set_input_tf - calculates the input transfer function based on expected
> + * input space.
> + * @func: transfer function
> + * @lut: lookup table that defines the color space
> + * @lut_size: size of respective lut.
> + *
> + * Returns:
> + * 0 in case of success. -ENOMEM if fails.
> + */
>  static int __set_input_tf(struct dc_transfer_func *func,
>  			  const struct drm_color_lut *lut, uint32_t lut_size)
>  {
> @@ -285,13 +335,16 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  }
>  
>  /**
> - * amdgpu_dm_verify_lut_sizes
> + * amdgpu_dm_verify_lut_sizes - verifies if DRM luts match the hw supported sizes
>   * @crtc_state: the DRM CRTC state
> + * @adev: amdgpu device
>   *
> - * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> - * the expected size.
> + * Verifies that the Degamma and Gamma LUTs attached to the &crtc_state
> + * are of the expected size.
>   *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * -EINVAL if any lut sizes are invalid.
>   */
>  int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>  {
> @@ -327,9 +380,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>   * of the HW blocks as long as the CRTC CTM always comes before the
>   * CRTC RGM and after the CRTC DGM.
>   *
> - * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> - * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> - * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
> + * * The CRTC RGM block will be placed in the RGM LUT block if it is non-linear.
> + * * The CRTC DGM block will be placed in the DGM LUT block if it is non-linear.
> + * * The CRTC CTM will be placed in the gamut remap block if it is non-linear.
>   *
>   * The RGM block is typically more fully featured and accurate across
>   * all ASICs - DCE can't support a custom non-linear CRTC DGM.
> @@ -338,7 +391,9 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
>   * management at once we have to either restrict the usage of CRTC properties
>   * or blend adjustments together.
>   *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * Error code if setup fails.
>   */
>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  {
> @@ -373,7 +428,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  
>  	/* Setup regamma and degamma. */
>  	if (is_legacy) {
> -		/*
> +		/**
>  		 * Legacy regamma forces us to use the sRGB RGM as a base.
>  		 * This also means we can't use linear DGM since DGM needs
>  		 * to use sRGB as a base as well, resulting in incorrect CRTC
> @@ -393,7 +448,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  		if (r)
>  			return r;
>  	} else if (has_regamma) {
> -		/* CRTC RGM goes into RGM LUT. */
> +		/**
> +		 * If atomic regamma, CRTC RGM goes into RGM LUT. */
>  		stream->out_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>  		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>  
> @@ -402,7 +458,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  		if (r)
>  			return r;
>  	} else {
> -		/*
> +		/**
>  		 * No CRTC RGM means we can just put the block into bypass
>  		 * since we don't have any plane level adjustments using it.
>  		 */
> @@ -410,7 +466,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  		stream->out_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
>  	}
>  
> -	/*
> +	/**
>  	 * CRTC DGM goes into DGM LUT. It would be nice to place it
>  	 * into the RGM since it's a more featured block but we'd
>  	 * have to place the CTM in the OCSC in that case.
> @@ -421,7 +477,7 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	if (crtc->base.ctm) {
>  		ctm = (struct drm_color_ctm *)crtc->base.ctm->data;
>  
> -		/*
> +		/**
>  		 * Gamut remapping must be used for gamma correction
>  		 * since it comes before the regamma correction.
>  		 *
> @@ -452,7 +508,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>   * preparation for hardware commit. The transfer function used depends on
>   * the prepartion done on the stream for color management.
>   *
> - * Returns 0 on success.
> + * Returns:
> + * 0 on success.
> + * ENOMEM if mem allocation fails.
>   */
>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state)

