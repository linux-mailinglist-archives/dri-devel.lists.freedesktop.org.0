Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4C866FD4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D4810E693;
	Mon, 26 Feb 2024 10:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmEbQyOd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927A510E30D;
 Mon, 26 Feb 2024 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708941857; x=1740477857;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JI2DepxFhs9mINlUq1a/dyoe2x2KkQh/+0iBDNXXz5s=;
 b=hmEbQyOdJvwy0J2n1XLo3J3oYTNPI8EuFbt4tgL8302fK2mD9/7RBIYu
 oIOxew1DF4wJEEySBSrqVqF8+kGKL0OH8YSr9CJLX3jZaDIR4h9EFyxOG
 MkTdQfLHDM4kK+TI1XEV9w6tSoA+3E4waf1MET2K0dPsJn1otVzrMgh3Z
 XRnfbFsyNcnbXRptODhl41p2Suc+WQzeJC2+w9ZYZq5+3OT2UXCJJ8XtC
 8uKG6uqWlvS/BlMahw+GGmeQ63aBkTEiM0KLrIxrLygSvpLaNG+O7Wh3F
 Z1Z2dhYj170ow93K3f0ZO8tA+2NB4XjSjhyBqOKMpM/mrBpuTiumHxivn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3363360"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3363360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6604706"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 02:04:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 02:04:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 02:04:05 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 02:04:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzHinWPQ7q9B64ohMMUrl9U9p27wesHvT0pVKaJQm69uiRcXAaH0YTk3EBfS9LPY/d58ShDfeWjw49Q7dbN4rttXWyFnp1KK7ZrsxgTibhlpeDrcl2IIEA0HTimjoSOFSedE1/Sm2MclSKlZZhIB2eKPTfdi+1H9Yk6VxutICX2HZ08GnOpUjZC8AbXB+yLy4SP/sh75KunHETNJqX/rvPmTOSPyappPOz6nQWsQGB83Bl2mVgAmDvayFRmjE/JyG5SpJhXrVVavScDQbGkHC2sRwbCZr4AaHgjmRqovJNMfUUWhZV2qUXeUqPschybd1LGVON6jbkcSydjQn+qeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDdkSxdNcbgZvelT7QQ9zlu7S2aSMpGJkwomaUS2u8c=;
 b=j0Rnt+Ql7S/Qa4HQ3GnVt3tlP81LhwwsSGbvtk6riKmn+5KdZhM3thy33t9/SjfOhJh97g0cNZHTjJeWgTieEVSipCsFuHdMTZac/mtu+1kd6Nmq1Cjp1zRU9BJM/3+I3tg27EslVb20rase54D83gmlOGWLgt/EafCtcyVQjTO+hQ1i5bcYuNOqno81hWe0LpVyKGQPUkL4KuYRosuruiHAHC+Rs3LbKiXwCrjvZxGyosaIafh7LYS1tIu+ibXDJN5O9kSEfw/zz7hTvvQibqIEQeEnzHH/yYaq6jqlfA+lmIUsbg7zN8tENEDLWXXKsa+Jx9MFDUX72EulhH72qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Mon, 26 Feb
 2024 10:04:03 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.023; Mon, 26 Feb 2024
 10:04:03 +0000
Message-ID: <e026e2cf-66d6-41af-9cd6-430e9cdf9d8e@intel.com>
Date: Mon, 26 Feb 2024 15:33:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/i915/display: Compute vrr_vsync params
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240222121223.2257958-6-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240222121223.2257958-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f0ed86-b571-4f82-b09c-08dc36b24276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiFrxbHHv6leI3X4jrgcjJSxAHDkRfjwx+Rd1KDdMQ1T9LOiq+XkAoEb4e3WH2KE63h8ULGXOZxA9RruTZIZe9y2no+vlFWzLutB3HV7BrmZRzarlg6IwbNau5GC1jDpVwL/PajGE1ZCRfb/2LIsQPFlyeYHHaAJN8543UMkL4kdNCHST8Oq6+WaF5AppkLKfo1EhfKu8izOdkgDB2FbyWySu8mR02CjpJkvl8bm/ususOGbkeHyPPThEvwrR+QRQW1lq3nxgkPmg2A889NtSziMeukBtnFhfZcuvPnDtdRFgaXHh46za6Erk0onSjEuQ/XXrAQ9YlPdeBnNDuL8XlhPDOSAJpB3cw4Sl9JcLx6G8F82U/NXWaAuVydG/QtbOXsy7yMFJXnZt3TdlqI3aDV+8R4255D2RhTOH+QZHCIQ3Aoh3Yyo/bOaVljVpPJjGWaaT1vsn0d/QACVx5RdLhxZtDvjnykiVvg+7YcL7RXSxyNRApPCiS1gz3GXAvHCsQJuTr1mVn+A57fQ3Kgcm8z0q5lb4JPfZtY/6nvdceSo1I2nZCuRMjI3rxl8XmMUse1fBUVJli/k27hDz+iPUc4Q4v7MeHEAiJqVo4VXMTq0Nqj+aseLod9g2ukU6o0D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnhFU3N6UlNERk5CWEkyZmErM0tVNGFkS3JUSjV4aEUxOUpBWXJ6WE9NN25l?=
 =?utf-8?B?c211QXhHM0pLWjBxUlcraVFDWWFLUGh4cTRYbjczL2VCS3lacEFYZzQwaEZu?=
 =?utf-8?B?OHBVVDNITWlhaUxwZzJjbzRaZE9WV0ovWmhtbDVpVFpsVk9hSWZlZUpUNDJL?=
 =?utf-8?B?b1N3RzR5SWlXM00wNVNFb3ZPMGRrb2huK3NndmlodmJPaU93NUl6MWd0Rmlk?=
 =?utf-8?B?Z1R0elRlMXMzSDc5U2RPTThYNUp0eXNOZ2Jua2d5U2dNMksrek5jM3JEbHF0?=
 =?utf-8?B?K3JHSE5hUEVkdnc3NHhxaWdVNE9vNDFzSExwUTBMUE9QbnR3VUsvSXQ0WEtY?=
 =?utf-8?B?RnV0ZGlXQzlWUTY1Ync0R3JrUWtXeWtUUHg1cjc5YjNTcWxwcFdlRjhkZGVz?=
 =?utf-8?B?bnBpRkJKekRJSGFaT25VUzB0SnFJYVFVSE85WjJla3lXUUFHL3QwdHAyOVRL?=
 =?utf-8?B?OXRMTEVuNzgzeTRZMHpzYUhMd28zTTJsN09wVk5CamVjMGZiL1h0MlEydHhj?=
 =?utf-8?B?b09sdkx4TkVVV0JVZzRxNlNOTFNVaFlOdnhsUUdqTEs1b3BOL2xsMkd5OUg5?=
 =?utf-8?B?SUVMZHh0OG16VjFnWU5uNkFucnl0V05GQms0c3JsSUtjckFlT0t4d05rOXRz?=
 =?utf-8?B?MVNLOEViNWF4ZkNJOHVQaDNxSy9OTDZBQjJYelhhMFJWa0QxclhCc05oSGpj?=
 =?utf-8?B?SmgycEtjVEdzRUszVjRoakNyb09sQjJ4dS9QbnBySEY3ZEJhWFRMTStqV3Bj?=
 =?utf-8?B?bDVvRkx3Qzh5RmN5bzZkbDZDQjJGZWFOOGpYVTRyTURNVmZUSC9tbzZwbnFS?=
 =?utf-8?B?SFVaM3NBQkg3VnpWbFlPdDI2dlJkekVtUlFEcHhwSjhIVUlJUy9DVW5ybXlz?=
 =?utf-8?B?NFR1bHEwNTg4YmdWZkJVbGVEWEFpOVA5TThUSFBIYmJIU1R3UDFpSVBsYmhC?=
 =?utf-8?B?blA5b2hwRFR6UUp2djlzdC9FZUg0dTdndS9sU25tWm1MOTAweGNYajhNYzhI?=
 =?utf-8?B?OWZjMXRDeWU5M09XczQyTHF3OVQyZ2NnTkZNUi93MlU2R2F4TzVBTDZueXg0?=
 =?utf-8?B?VXhCenRoU1pLVHZQYXN5amwwbTJ1c1JXNlQ5WVVCcnVHcGdmYThoUU11elpu?=
 =?utf-8?B?U1JJYmpKRWxHcXBJc0xMV2pud1M4bGNHME9oUnFKLzhPUWVORWlyNjBDbFJw?=
 =?utf-8?B?WjFYWk04U1hQV05vdjU1SkZnQUJGeWllSGdXSGhWMXBVZm04dFoxSTQ4M3ZU?=
 =?utf-8?B?bk1yb0dudHBnRzVZU21mUk1PcVBzZU1JSEVZZys0Mnl5ZWwyWHl0N2tkd0xI?=
 =?utf-8?B?Y2ZFRFdEei9xbm1hdThzY0hlYlFyOGQ0YkQzWWd2MjhsMzdqVEN0Qyt1emZp?=
 =?utf-8?B?VDFVS0dmY2hiNHYrZGtqeERoS041dXpSbFBLSkRHbDl5WEk1Q0czeEEyQ3By?=
 =?utf-8?B?SnB0QnRCQ0JtSkJWcUNiY05WSVpVVFE1N0lhVGJOU08vQ1BHa1JNdnRrLzBu?=
 =?utf-8?B?eW1WTGpHdmQ3M2hGa0NFRjVxZmxuTE1iL25VR1hkcThJbGo5QXJVRUdoUEU1?=
 =?utf-8?B?T3ZCSTdCV0dxc3MwMk5PaG5RNEJYR0haV2Q4d01LeHBRK29Lc25wU2ViTEl0?=
 =?utf-8?B?VTFpdHhEMFJuaC9MM1cvRnpLMi9rTTVFWStiS0dhamtPMFdrYTg2WEJrK0Rk?=
 =?utf-8?B?cnF4TlhydllLcTNVcE05YkZ1ZFVXS3hYdStoZ21xQVd1TzUxdmpoWVI2UmRn?=
 =?utf-8?B?T082NFFLZDFPRXIxV0E4VjV1TE9NMnJRaDF6Q1hNVkJ4QWFEU1I1c3JVUjBM?=
 =?utf-8?B?d3FaU3ljT0dadkFtN3JZL2hkZkxCem14dzNnVVZxaTZvRHJXeWc2OE4wMVdQ?=
 =?utf-8?B?bHBMVWhaaGlDSkd5OE14M0JVakd1TTVWSTN5bmlGV0NxekluNlFHdTY3eDFB?=
 =?utf-8?B?amNtWXd1QUV4WVdQTTVtbGtWa2Nwa3ZBbFpDSVhBdXZHWUhqQ3BLUkhnbkpj?=
 =?utf-8?B?aTRnb1d3QlhJNVRjSEVrT3JaM3ZKOHBlN2QwdmkwZDRJck9INFN4MEdDMmt3?=
 =?utf-8?B?YzVKanE3UUlWYmVoVmZLVEpsSENWNWFKdHhWUTBxeFRkWnVaWHZ0YjNYK0dn?=
 =?utf-8?B?LzVsUWxFN2xGQzVVNGJ5VTFkWDVCSWdQWWZ3Q1MwN3BkZkExQ21hbjBNejZq?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f0ed86-b571-4f82-b09c-08dc36b24276
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:04:03.0486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zscJQUaTByg/OXK5sc90dlmO4iBBH2Q3YrsbS0MtteBv2TJ7U+erBZyH0rd5U4my9K1qZelYwhgpDPBtY7VtuAMNq4ilHrsrwY/dC5gtcnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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


On 2/22/2024 5:42 PM, Mitul Golani wrote:
> Compute vrr_vsync_start/end  which sets the position
> for hardware to send the Vsync at a fixed position
> relative to the end of the Vblank.
>
> --v2:
> - Update, VSYNC_START/END macros to VRR_VSYNC_START/END.(Ankit)
> - Update bit fields of VRR_VSYNC_START/END.(Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c       |  1 +
>   drivers/gpu/drm/i915/display/intel_display_types.h |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c           | 12 ++++++++++++
>   drivers/gpu/drm/i915/i915_reg.h                    |  7 +++++++
>   4 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 00ac65a14029..5994f7fcbb6a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5321,6 +5321,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.flipline);
>   		PIPE_CONF_CHECK_I(vrr.pipeline_full);
>   		PIPE_CONF_CHECK_I(vrr.guardband);
> +		PIPE_CONF_CHECK_BOOL(vrr.as_sdp_enable);

Need to add PIPE_CONF_CHECK_I(vrr.vsync_start/end).


>   	}
>   
>   #undef PIPE_CONF_CHECK_X
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 93b4b7dff1d0..7859e4baad4b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1416,6 +1416,7 @@ struct intel_crtc_state {
>   		u16 flipline, vmin, vmax, guardband;
>   		u8 as_sdp_mode;
>   		bool as_sdp_enable;
> +		u32 vsync_end, vsync_start;
>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 08e3ba69bd30..29ddf504d94b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -150,6 +150,13 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   
>   	crtc_state->vrr.flipline = crtc_state->vrr.vmin + 1;
>   
> +	crtc_state->vrr.vsync_start =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
> +	crtc_state->vrr.vsync_end =
> +			(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +			(VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) >> 16));

Need to add trans_vrr_start/end also in vrr_get_config.

Make sure to read/write these only when we intend to send adaptive_sync sdp.


Regards,

Ankit


> +
>   	/*
>   	 * For XE_LPD+, we use guardband and pipeline override
>   	 * is deprecated.
> @@ -273,8 +280,13 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   	u32 trans_vrr_ctl;
>   
>   	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
> +	bool as_sdp_enabled =
> +			intel_de_read(dev_priv,
> +				      HSW_TVIDEO_DIP_CTL(cpu_transcoder));
>   
>   	crtc_state->vrr.enable = trans_vrr_ctl & VRR_CTL_VRR_ENABLE;
> +	crtc_state->vrr.as_sdp_enable =
> +			as_sdp_enabled & VIDEO_DIP_ENABLE_ADAPTIVE_SYNC;
>   
>   	if (DISPLAY_VER(dev_priv) >= 13)
>   		crtc_state->vrr.guardband =
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c02ea07af4c2..3e0853458ef4 100644
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
> +
>   #define _TRANS_PUSH_A			0x60A70
>   #define _TRANS_PUSH_B			0x61A70
>   #define _TRANS_PUSH_C			0x62A70
