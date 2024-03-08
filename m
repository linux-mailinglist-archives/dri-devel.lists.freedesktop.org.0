Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD554875E09
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 07:48:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C9010FE97;
	Fri,  8 Mar 2024 06:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKo7WivB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F63B10FE97;
 Fri,  8 Mar 2024 06:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709880481; x=1741416481;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1mEAeojx5ElFL/FoItDbrqGXOwb4vfZz5epNbinLLP8=;
 b=DKo7WivBBvm6EEn4KAjQmuQR+QJU1iO2UIpgKGrNK3+pgmRYLGaksb8f
 wHBgD1AkCODPXYeSZpeiHAHXognv6P+zDY46QOF/J881nVA5mrHC192n4
 BnIDuOqGiJbFPrAf7f4NmOj8tSLIJI3dsz9k0FHuE+8f6zD12A0VZs9B9
 uDEwUT6GpuJ6S7a03RNN9iuMoXF5rYznGavrXIfVPIlS1oe1oHPKv7IVE
 OmvPjncX5bnV9b0VP6Xgb39dt1GZwn7gvmLk9Q4mkwjBamVyJSL3vVWyA
 HGngOPI/xbvRNKrZn6m9qky4HwWvjFLU7asetJ48e5b+Rl95cSbEk102V g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27063701"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="27063701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="41283854"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 22:48:01 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 22:48:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 22:47:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 22:47:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 22:47:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJibBHGXo+07NTdPbtxdoeghRCJmOnWwR4GMEsfY15FtZuPMy7sn5OQhnt1mdUkA/GV4inYXGKEblem+EKlvDvSyln1+6DEHqyALx7pZUA9XHZBF86zHUYNzujKpbPibvL/V1xcjGYGq/8paPTDXVbr02cwFVFCahO9baHa+WZopNxGiB5HlIx57dVMTbkk9pEwpGExA2+VAYXtHcD9/j2O9IN7+dwJfeOf8YE6qltUEDaf6n0QZeUqbDkd6OHPbZWkUmvAToFJeEF1MC7yzUGo+xKgECmIC6h4RxMmo0Oy+DBChzjYd19dWzFMaEcKMx1TW1tVVMVO6uFsQnI13dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Ls1tmn3bhfaPeh+uctlktbNBFf50cYHFcmamlsgVQ=;
 b=f2iRbbTmnTFpBWKdpUsTHpJ8qrPxKZDCyzObXUFLfQ3nG0lov5HUcLD1yOawPpBxjPLmQpwAG1FLzWKYAX3JudiZfICu83VSwc9yL3LlbjxPOkPV50sUII0d0bc9Cl+f1chIw7f0oPHkoWHdPIN3/2Axxe62gVxookd9DMb8E0JzVwAMi3S6yc/LsHq0RH+iU5YsX9NouW1+lPG+iupxw6oiOMJMMl4UULBLcDa/fBj/XANLpzkDD08a/wed7Na9hgCm8kVXxnQRbvTQJVsX+kQagXBxy/7TNP61dTGbwKuxtw5ycYtDkV+SwuXSBAq/zIzikkP2bxw3i7rzVgNqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA1PR11MB8327.namprd11.prod.outlook.com (2603:10b6:806:378::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 06:47:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7386.005; Fri, 8 Mar 2024
 06:47:57 +0000
Message-ID: <52d413d9-837c-4b7b-b36f-056233b3e5f1@intel.com>
Date: Fri, 8 Mar 2024 12:17:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 8/9] drm/i915/display: Compute vrr_vsync params
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240307055329.3238634-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240307055329.3238634-9-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240307055329.3238634-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA1PR11MB8327:EE_
X-MS-Office365-Filtering-Correlation-Id: c40988f4-3133-4414-578a-08dc3f3bb006
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6qQoLSF/JsATDDhq82PUh6mGdh625SQFp7u+WAGgJZr4Vx3dtChZrEDy/GHRJmr+nFymsYlQAMk0r5xTuO0Yd/21l0/EPHA3JNacynx7tvycQL0FIdw6bWtkzpijSyZvd4hNNQa7WKdTaP4ZPN4GTZJkb1VNf3IpQQMmkeHv3oJ35P25JsfguP8lAaSI31oUoBROW84hckEcjHPF5rrYOMQ7MtMAR5V9tHQt2M+JLpYp/gps264pd3eD4JlDndVg2/XxEs9PpRzW5rcignyMmiN4geI6M4zkrOdlJXusCZJ/JYZLJb5GDuTtuASKqRLaVcR0jNZ1xgqLDnAKaRiuUp0bRaFmvH27sUd+/oQNk66xY+F5TiDRBu7Ik/hoG9g99K2VILfMGjF/3AkaXdtXNM7DVHNLc8zFEJOOyL6OGP6QjWRT65OApxSCnNya9QNsir0casoODJB3mNVNKoAjIYa9LhY/a8JOKuHPJpXOaiLxfRnTiQV18Zy4jO5m1hE6VxVr6fYbTFHH2K+aS1uPIUga3W6eC0E4IXvs4NsasKaqOy/GnqAE4RUqPYOHYWRzHXoJv42br2PIwVqIyCOAIVwuOH/1A9elQK8y9dqv9bJNdioXf2uFjL0jwLq3oM3NeAkGydiQReGkFAnkHQzyx6ODdFGejMOip1BA0fjaeHc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xHOVVuakZBZkU4c003dkwxTUwraVhYWTBWWkVRVkFIL25kVENJMDZ1M3ZI?=
 =?utf-8?B?SUR2RUx6UFRhVXQxTEgwSE4raU4rckRoSDBZRmpwUWFSN2FFMmlUNFV3eW9W?=
 =?utf-8?B?QllzbHFyc0w5Z3RhWlZXWURYS0V6NEdqYkFFOVJtb2w2SEFQTEMxZlRSb2ZN?=
 =?utf-8?B?MDVBYmNzckk5M0ZuL294dVluQXVsZGhYcDRuWk5sNWpLZVJCYWg0ZlNkWEg4?=
 =?utf-8?B?eGRLN2c1bjZ6ZFp4N3ZCNWlBaUhDZko4UFRYRFludFV3aS9TYll4MC9HdWVO?=
 =?utf-8?B?TXl2SmhoTWwyYUdjSVhXSE1xSXlPblRKQlFOR0pkdzNyYnRLbXVaZm1aWEtD?=
 =?utf-8?B?cUNRNXJQNmtvSHo1S1VpMXZ3cDhoY0xzZ0ZsQUMrRS9vR3FoMUkvNWFSd2w5?=
 =?utf-8?B?NlVRN2FoZEtCOGxrRnM5ODI4a3JqenUzaUdaUUx6Tk5iVjBVZUhGcC85WkVh?=
 =?utf-8?B?ZkcyTXBVU1A1RlZHSElhTnB4KzlWME8xVUZ1MkZhTDNKMVVnd0R5WHRvVW1Y?=
 =?utf-8?B?WSt1YlBIVHpHMkpMSFNoVEp1dHBBbDR0MlBVdHdCaldMUTNkS1JxSDV1eFpo?=
 =?utf-8?B?OXNQR3pUZGsvYUk5U1ZISzRkclZvTnY5SGptTWJkeVUxcUxqd2NQRlBnL0w4?=
 =?utf-8?B?VklIdUZPQVJ0NGhSYUdnTXBEaFZjMk04NXljbnV3M3I3YkZMNnBtZXRYRWNq?=
 =?utf-8?B?clZrSWZJYkJzenlOc0M3c0dJOVNiY1o1WC9XWlpGeUUrbm81RjIxZmFxcDh5?=
 =?utf-8?B?SmlmL1Fpd0hDbVZIYzBOSmNQVjJKRk9GR296VlhVc3FObnZSbE4yRC96UW9u?=
 =?utf-8?B?QXVWZVVRaE9kVGhyaVozNVFCcktRKzJ2SWNycnJTaWtKbzd1RTYxWGZKM0h3?=
 =?utf-8?B?OVRpZjZqYzFUWUN0MTJLaXZHYW1ScUJtMXFXODNSTVRZc25xdXF1WEJSMEFN?=
 =?utf-8?B?d250b2pZalhmV2R6R3pkL1F2dnMvQW91c3RHS3ozSWFacmltZzF2OVdjLzNS?=
 =?utf-8?B?SnBWNFpTT3Q0V3lJSDBXNTdld1NFSkdyb3RlOC9jS3FFTDVONG0xWGlWTk9U?=
 =?utf-8?B?QUVBTFBwSm5yV2FLbFB2WWxaUFlGMlBaZmczTWlreU5PME9XbS83WVowS0hZ?=
 =?utf-8?B?NmNXeTZ4eWNFZSsvK1lIQktndGRrZVhNUFVnMXhCUFNNR3JQWjczQUdHWGJ2?=
 =?utf-8?B?UFhnbm96M0tjTFcxMTAzWElSSnRTeDJtV0tkMkZ2b2c4UnVONktkLzl0OTRN?=
 =?utf-8?B?L1NPSlhrQUpCV1FpeGcvaHVpZW52blFYK0QrZmJXQ3ZyK3NXVWJZU3Fkby9G?=
 =?utf-8?B?THdsK3loYkhOTks2QWd5cTdwdnlDa240V1VFNDFxYXQrekJlQXpkRE1ld0dP?=
 =?utf-8?B?bFJsMUFGRGNCS0d4OVpFcjFZNTYvcldqUDF0VDNJUExLRUpSNEdZWFVyVEJ0?=
 =?utf-8?B?NHpGSW15dWw4VHdnL2I5UnI3SUZHRHdla1BVcnp6VHU1c3VvSDhadWV1OXBP?=
 =?utf-8?B?ZkhPSnZtdEVleGkycisyUjdQUDlweDRjL1QwQVB1Smd6WUIySGVkaU9TWVVS?=
 =?utf-8?B?Q0hUWVdxMDVBZk1oai9yRVQvb0J3ZitrQmFac2h6dVNrKzNmZGVBZlA1dFB0?=
 =?utf-8?B?OXNkYTZxbTlwaWU3NkpGSUVNcVRUT3BxTXZUV05qZC9qaVhucHRwVE4rVHhR?=
 =?utf-8?B?SEtLS0UzL1Nwcm5ReUVGZ05KR0xrYkVKR2NwSWNlNHpveXZlQlFFY3ZuckF3?=
 =?utf-8?B?SFRpTEtRdzRHckJGTDV2RGxjVmtoT3ZDZ0haaW9YQnZ4VzEvZGJ6NHhISTdx?=
 =?utf-8?B?LzJkM2Q2OXdtcGRLZkNXL21JZ2ZXanZQRmRGRy9WdnVOcEtZZE50Qk9jb1dK?=
 =?utf-8?B?b3ltSzBaTmtZcGJ3dGR2SWxXMUFvZm0yY3d2TUltblhhd2hXVm8zMTJYZHBU?=
 =?utf-8?B?YzZZcHlBQy9JKzU5ME1OY2VSNUJReXcrU0ZHL1dDWW9HRFV6ejJSbVdXQTQ5?=
 =?utf-8?B?ZWc1U2phNEdpTFpoQWtNcGlLa2phVUJsRGJHNWxjcWJZanFZVXI0eG5hUWFE?=
 =?utf-8?B?cTBpS0FkWjlSMnZHZlpFV1NpK2wwS1JZeTJSQlU3L0loQzd4cndYY2l0TUV6?=
 =?utf-8?B?TVEzK3NUL0l1MktRU2xIMmN3Z0QrTFBnZElENUFHbWJaakludnd3blZWMEQx?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c40988f4-3133-4414-578a-08dc3f3bb006
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 06:47:57.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHFz0UsZzrmnhqPxIlMO8zL7MGCAps3XQMX6UbIkiJeTJJ48PwfC1kIfffH84mvpiihgW1wUnmRjSwvp+RmhM34n0uquFFlGw+LH/rR/KSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8327
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


On 3/7/2024 11:23 AM, Mitul Golani wrote:
> Compute vrr_vsync_start/end, which sets the position
> for hardware to send the Vsync at a fixed position
> relative to the end of the Vblank.
>
> --v2:
> - Updated VSYNC_START/END macros to VRR_VSYNC_START/END. (Ankit)
> - Updated bit fields of VRR_VSYNC_START/END. (Ankit)
>
> --v3:
> - Add PIPE_CONF_CHECK_I(vrr.vsync_start/end).
> - Read/write vrr_vsync params only when we intend to send
> adaptive_sync sdp.
>
> --v4:
> - Use VRR_SYNC_START/END macros correctly.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 30 +++++++++++++++++--
>   drivers/gpu/drm/i915/i915_reg.h               |  7 +++++
>   4 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 88158f06bf82..f62c3ae7f0fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5377,6 +5377,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.flipline);
>   		PIPE_CONF_CHECK_I(vrr.pipeline_full);
>   		PIPE_CONF_CHECK_I(vrr.guardband);
> +		PIPE_CONF_CHECK_I(vrr.vsync_start);
> +		PIPE_CONF_CHECK_I(vrr.vsync_end);
>   	}
>   
>   #undef PIPE_CONF_CHECK_X
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 098957cea25b..e8ba3c077569 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1423,6 +1423,7 @@ struct intel_crtc_state {
>   		bool enable, in_range;
>   		u8 pipeline_full;
>   		u16 flipline, vmin, vmax, guardband;
> +		u32 vsync_end, vsync_start;
>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 5d905f932cb4..8f4605884052 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -9,6 +9,7 @@
>   #include "intel_de.h"
>   #include "intel_display_types.h"
>   #include "intel_vrr.h"
> +#include "intel_dp.h"
>   
>   bool intel_vrr_is_capable(struct intel_connector *connector)
>   {
> @@ -113,6 +114,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	const struct drm_display_info *info = &connector->base.display_info;
>   	int vmin, vmax;
> @@ -165,6 +167,15 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	if (crtc_state->uapi.vrr_enabled) {
>   		crtc_state->vrr.enable = true;
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +
> +		if (intel_dp_as_sdp_supported(intel_dp)) {
> +			crtc_state->vrr.vsync_start =
> +				(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +					crtc_state->hw.adjusted_mode.vsync_start);
> +			crtc_state->vrr.vsync_end =
> +				(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +					crtc_state->hw.adjusted_mode.vsync_end);
> +		}
>   	}
>   }
>   
> @@ -203,6 +214,11 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
>   	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
> +
> +	if (crtc_state->vrr.vsync_end && crtc_state->vrr.vsync_start)
> +		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
> +			       VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) |
> +				   VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
>   }
>   
>   void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
> @@ -263,7 +279,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> -	u32 trans_vrr_ctl;
> +	u32 trans_vrr_ctl, trans_vrr_vsync;
>   
>   	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
>   
> @@ -283,6 +299,16 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   		crtc_state->vrr.vmin = intel_de_read(dev_priv, TRANS_VRR_VMIN(cpu_transcoder)) + 1;
>   	}
>   
> -	if (crtc_state->vrr.enable)
> +	if (crtc_state->vrr.enable) {
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +
> +		if (HAS_AS_SDP(dev_priv)) {
> +			trans_vrr_vsync =
> +				intel_de_read(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder));
> +			crtc_state->vrr.vsync_start =
> +				REG_FIELD_GET(VRR_VSYNC_START_MASK, trans_vrr_vsync);
> +			crtc_state->vrr.vsync_end =
> +				REG_FIELD_GET(VRR_VSYNC_END_MASK, trans_vrr_vsync);
> +		}
> +	}
>   }
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index dce276236707..53d8eb7ea1ea 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2007,7 +2007,9 @@
>   #define _TRANS_VRR_CTL_B		0x61420
>   #define _TRANS_VRR_CTL_C		0x62420
>   #define _TRANS_VRR_CTL_D		0x63420
> +#define _TRANS_VRR_VSYNC_A		0x60078
>   #define TRANS_VRR_CTL(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_CTL_A)
> +#define TRANS_VRR_VSYNC(trans)			_MMIO_TRANS2(trans, _TRANS_VRR_VSYNC_A)
>   #define   VRR_CTL_VRR_ENABLE			REG_BIT(31)
>   #define   VRR_CTL_IGN_MAX_SHIFT			REG_BIT(30)
>   #define   VRR_CTL_FLIP_LINE_EN			REG_BIT(29)
> @@ -2087,6 +2089,11 @@
>   #define TRANS_VRR_STATUS2(trans)	_MMIO_TRANS2(trans, _TRANS_VRR_STATUS2_A)
>   #define   VRR_STATUS2_VERT_LN_CNT_MASK	REG_GENMASK(19, 0)
>   
> +#define   VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> +#define   VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VSYNC_END_MASK, (vsync_end))
> +#define   VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> +#define   VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VSYNC_START_MASK, (vsync_start))

As mentioned before use VRR_VSYNC_START_MASK above.

Also add this whole block together, and not insert this in between 
existing definitions.


Regards,

Ankit


> +
>   #define _TRANS_PUSH_A			0x60A70
>   #define _TRANS_PUSH_B			0x61A70
>   #define _TRANS_PUSH_C			0x62A70
