Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0D86FE69
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B7810FF2A;
	Mon,  4 Mar 2024 10:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiYzW0Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D956810FF2A;
 Mon,  4 Mar 2024 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709546977; x=1741082977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ld8sDRMG+I/TMV/0W9CgtZxks+3WcPqd3HhMLmmBl1o=;
 b=UiYzW0Ls1QYM2o2ZCGv/+SSHRhNCFK38ScMXUkjcbkq01/SKWLS9g+PX
 gvDS1pyFgWgYqvwgQH1Pe8H6V3/URNHPSXzKtV8g/5GQxqH8agx+XxXoU
 zTkRFg39IE64N8wpxm2x45fh2jnW5tkxVkz/UUCNzMi0WG47lRNIIFZ/u
 w8dQmDANxDZDUO/Dzp3wkCtg9PuvYRYS8RVmGnIrKw9FCzy/q3aQpI0e7
 4nUBRxLUUyB1vWyfQBktfbB++nEvIgoTRqZlBm+e6Nq/OkdQNH08CWvst
 iuMIvXdNjjhY4l2orDqdL742lJYtuS5OTCIdl4lrvWDJ4us7wOHT+Q+A8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4192715"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4192715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:09:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9011968"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:09:36 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:09:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:09:34 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:09:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:09:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk74UH57ix6ZyJOapv0eVe+c8sP/H4dTS4cPwCzhFopUz6oSRw5MB0s7ww72edds5ReDoRh5yuoggxZfzxPCY0jmdeLqpEivWjDejii+Bc3AtSYzUqKaTBobMMFn87TySQwRu+gQ2TiCAIi18CxDq+KcVzTCXm8GHxSbCYOFKn7sWhMn6eNE1sWLOWym1K8un5pg4PG2T9Rb/w3mLJccZSbeA+FRm/zcmRI5UuGxyuuZ8YqS2YK5/shjLvrV1NzinAmid375xq92xKo3xZIsGq0hXrCtYDglxn/pbz+oNYfMDS/08UgEZnz+xlZHq7BERgUEKKkqmg4STbYx08ytsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4Jx9VhLnc7K84GV+IkVwZCSSQZj4ZlDQ4sR+qHh1LM=;
 b=I3bZudQgSxvy6YqDIlkNBHQwLbC7ga8HQJbc+txjefj2Ix9BimoOgiezbuywXKWgUOqsy4496i2bud3HhSO0HhY+Vupm+zHXDmrFo6vIPhRQqgcnjXu/uE+8LYCUtw/EM1Aqiq8jn0vHG3dqn2Bm/owFdQ4GVYuQxJfwiuiLCy9cOpyPUmoMn07rJ2/zRXr/oPBR25zL1Ir+17GrMuxstYDft5YuSeKnuGlNeLMJgt8jv7tbK3KKxTdtGT3zuo3Rk5DxF635e3o0rl65kuNb2qOlUfxlUQptl0aTiIjV9u01MXxENDh4x2OtRpoNwKAVZxd1i0l9yNWCKn0AvH8dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 10:09:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:09:32 +0000
Message-ID: <82b3afb2-b6b6-4ac7-a211-927250829c13@intel.com>
Date: Mon, 4 Mar 2024 15:39:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 5/9] drm/i915/dp: Add wrapper function to check AS SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-6-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PS2PR03CA0003.apcprd03.prod.outlook.com
 (2603:1096:300:5b::15) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 443d36cf-32f5-4be5-58d2-08dc3c332fe1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZ1p9tg5yfqiyQPuu51BZjeXyS9EWRWyWySyHk8ZL17CHRZFYSmGbq19tmENACj2Wtd1Qzh9oHwELuuPig+HESjZfyybKUcEVspyV93Q8l51fIEfLdotJ4EtOJsKVX7rvdvfO5/9B1JYAV2zH8qJqhN5qIFqtYUJ3RYuzmZgDOunUyfPmDxTUkW3/M27sf1nyVEv4Iyw3rtRyoFJW/hr5IZZPwqVwtSZLf9gp4qjsgKdczT/OxM+1aBLQDLObsCjVbcAn8pihd69YzsvRuqvgrn8ldMq9U41bLo0oX/12vBYS8xhBwwFJK2q3K0A8/xjMhUXGT9Irj2rkNZ9/E8BK1qeiFVCadITkKyrlgviRTugzzsqGIC9R9+c/Be0rtB98TNF6uknNSqwvyAmGDG4oSX2je2VSyZyld+SMwom8HvWqp2q0S2a8ql+PBYJpR0VnaVlWKNVmBxRYhL5dt5L24g7aiXqanYm36vWTFWj8KwhgmDa6DTO17ejFfnjOnDn4ulJESMHWTmpUI+dce0XtGLqMAZYHRYHDlohiYA8bdUD6xG5DIQ+YwU+CsMrkziO7dAXyBfT9wpaMg222tM2GMWDMuEier2hs2b9jLonf63/Hw33JHHH6kRHnpAhd8nln1LO7EBBWMCKfsv2g+seHiODk8fLReFABwhg/mzmN10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVN3TGVwWjlzQ2RkcGpJb3BzYmo4QXlvZ3dSNktIRWRqVjFIaWc0K3JsYzdX?=
 =?utf-8?B?WDRsN1k1Q0U0SjQ3elJiWDV0RWRTYUs4eFluZWtiNjBCU1Rsb2duc3BmT2Jx?=
 =?utf-8?B?YVNJQkU2cmRwUXRaNlVvb2lnQU9heEdXOEY2R0QwTU9mcWpEa1laLzV6VW9y?=
 =?utf-8?B?WUZraXprT2JpKzhPUDdySVJIajJPQnhvS3pXRmc5RjkzVlhSbTNPZE9nTG5P?=
 =?utf-8?B?WDV3bXRQQ25yamJIUVZkM25lbFMxTTdXOERyWDQzMG8rK1lpeE9VTW1Lc3VX?=
 =?utf-8?B?V1pFbXFrNERWWjRWay9qTmR5UUcvcEhacWc5Y2RZTnVEUHJrSlhibW9VMVhW?=
 =?utf-8?B?SE1DYVpScmhpRVFGYVJQb0dxWVBINENHTVczZDZhUWp1V3JqNHNTaW9zVWUr?=
 =?utf-8?B?azFKYnErazM3WERkU0M5U2xwNFI0WHdDUFlNdDdPcDBoTFlCZjBrR2pDUW5T?=
 =?utf-8?B?MHRPT01PclkrK21WN1U4RElXK2txU1FYbTgxQThtdi9HY25tN29QbkM5YmdK?=
 =?utf-8?B?QXNMUi9hVzcyNmVoUGVsTXB4alc4Z1l4cWVuVGZNY3pGYTM5TGVORkNTUzc1?=
 =?utf-8?B?YXllS3dkY3o4UGxwc2o1aDIwRUZ2SnJlZ2RRcnQ5U3hOUUZYcHlITHhRSnVn?=
 =?utf-8?B?blB0UEZ0Ums1VFBRRHEzNUV5czNjM3RYanVjZDY5Uno5S25kOHBRVVdNTmpF?=
 =?utf-8?B?bktGOVp3U2FnUEtRUXRKQXVZNDlIT2hQUXRsazlYbks5WkU2djlUT0M2d01E?=
 =?utf-8?B?SjBBbXBSWEhDYnIyRUZHNlkyVlJYS1I5TnhuWGxqWFl1RWVocUxHc2ZlSmlY?=
 =?utf-8?B?Y0wxc1Bxc0dpKzFWdzdWQ0tGZUFmOHE0MWpUWGVkY2lsVEw4NGM1UUlDbWp5?=
 =?utf-8?B?bnpiZjFWTjJTeU5SVUxTVTQ2anVHdzA0WHhjdkFkV3FjZk9aYStIR3lWQmFl?=
 =?utf-8?B?NktNdmdRWFMrckQzN3JQVzhRQm12NnZGSDJCYVFsc0FpdUQ0UlZEb2RvTFBt?=
 =?utf-8?B?QkJuYTl2YnRGeEJha0ZvSHBLY3VnWVQxaitjSmZBK0xHSXRrNFRaVUE0MW4y?=
 =?utf-8?B?RWZOOWwwM1JFd0Y5NlFXb1phbDhTRmRVZW00cTFnNUxVSTNoVExaaGtkSUQw?=
 =?utf-8?B?bWlKM0dNNmRieTVSeFUxZFVvS0szZ0NKRzBuMzdVZG10ZmtqZzFLUUpRdzNn?=
 =?utf-8?B?RWd5b0UxMTdDWldmemdvdUZLLzRUa1dYRFVmQXhvcmRuWmh3emtCSUUvd0dM?=
 =?utf-8?B?Q0FkR1MzaEJyQ3ZmM3RjL09JWEhSRjIyQ0cxOVQ0RmpsUkh1TTl3bGdZbitw?=
 =?utf-8?B?VTVVNzVUYXB1c1dQT1NLQ01JOEF3QlZ2RWY5RFRiclBENFZtMmFOd0FYMmlu?=
 =?utf-8?B?S2d3RncwcUNkdnVmQkdOQlNTbjBGcXF3d3R1K2dEdnN1VGhKVTNQRmtDc2oz?=
 =?utf-8?B?UzZQZHp1WVJlUjlKNCsyNTFVdXhUUW9TbGgvM3VFV1pkcVZsYWwwTTN2SlI0?=
 =?utf-8?B?OGZpeHZJcHZXbklXUXFIekZUR2FlZGM1ajlyOThyeDBPUHI3NVI5UHBaaXIz?=
 =?utf-8?B?bTE5WWNEcEZyMmpZNzNwbkI2YTJyd2I4VGk2azQyY2toakpyb1BQSDFoeHhm?=
 =?utf-8?B?RUptQUdsQU1oZEN4V0ViUUM4eXVMcGdMRHdoR25XSDV5dHlyOXI1RHRQcEh0?=
 =?utf-8?B?MmJSSTVEMktIMW5ITHoreEpxVlpsZnIxRFExdnUxcGorNVFBQkk0dkJ4WkZq?=
 =?utf-8?B?bXlqZVNtaVBQT3VxeW93Y2pzQXNGM1ROWVZ2dm1PVll1cDBHQXlsR1JnMEtI?=
 =?utf-8?B?M2tBaG5nQmNNbkd1dVAxM211QmpJQmhoS0ZDb0NLcEtrL0F3cVpnKzQwRWxa?=
 =?utf-8?B?TnJkNlVHbEN5VGh3bjVNUWlNSW14YmNxMkJ2QlYzR2o1ZERmbWZGRnYxKzlZ?=
 =?utf-8?B?aUVHR0lHWkRyMm0yckg0bjMzVm1HMnlsK085RkVLaUhBSTV3bkZSQXBvc3o0?=
 =?utf-8?B?SmFoTTl1YkJrZDVqNGdsSlN5M0I0KzB5ZVVZUjg0K3dWQkVwZFhmYU5JK1dR?=
 =?utf-8?B?YmlkU1VHbEgrMFl6R1FwOCt0NlVRc2U3YVlwMVJDeXl2ODNaZk5EbzhOZXF3?=
 =?utf-8?B?YzV2MGp6R0F5dHhSUDcwWndUdVJ3NzJwd01tU09aNEVENUhRem5jS0FVUXMy?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 443d36cf-32f5-4be5-58d2-08dc3c332fe1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:09:32.6558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/ideEiKAk50qpd2fU+5IqOXVZ7f4VKoJFyP1hQ37F+ZEdrgK6D3IrhmHoSMVrc8aGiBozvQ+feWkdII94k5Web+21k8+umqSo7syPoeYgo=
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


On 3/1/2024 2:14 PM, Mitul Golani wrote:
> Add a wrapper function to check if both the source and
> sink support Adaptive Sync SDP.
>
> --v1:
> Just use drm/i915/dp in subject line.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++++
>   drivers/gpu/drm/i915/display/intel_dp.h | 1 +
>   2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 99732ac1475d..1b3e7ae3dd76 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -122,6 +122,14 @@ bool intel_dp_is_edp(struct intel_dp *intel_dp)
>   	return dig_port->base.type == INTEL_OUTPUT_EDP;
>   }
>   
> +bool intel_dp_as_sdp_supported(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +
> +	return HAS_AS_SDP(i915) &&
> +		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);
> +}
> +
>   static void intel_dp_unset_edid(struct intel_dp *intel_dp);
>   
>   /* Is link rate UHBR and thus 128b/132b? */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index 564a587e2d01..0b15fd4750ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -86,6 +86,7 @@ void intel_dp_audio_compute_config(struct intel_encoder *encoder,
>   				   struct drm_connector_state *conn_state);
>   bool intel_dp_has_hdmi_sink(struct intel_dp *intel_dp);
>   bool intel_dp_is_edp(struct intel_dp *intel_dp);
> +bool intel_dp_as_sdp_supported(struct intel_dp *intel_dp);
>   bool intel_dp_is_uhbr(const struct intel_crtc_state *crtc_state);
>   int intel_dp_link_symbol_size(int rate);
>   int intel_dp_link_symbol_clock(int rate);
