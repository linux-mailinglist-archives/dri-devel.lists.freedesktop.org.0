Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C574886FF87
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29F510FFAF;
	Mon,  4 Mar 2024 10:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktCbi7l8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149C310FFAD;
 Mon,  4 Mar 2024 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709549586; x=1741085586;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ESmwyU/BVNzIbCSivFquoaYcYiaQOl9FRUyvX7WaeMg=;
 b=ktCbi7l8jHHhJBw9fmw6W3Vu0aXOpvcarRQzyHHlvMZ0wBTFNxisSKot
 WZikruPu2B4aKVtEnck7cGlcj2Ga7/LrySVF6rz1JRnT3i2+p/Ndf8FzV
 ukrcot/91gmOHOo8kXAFLHiFm/IRtP7jSokEWDQklgNyu8UWnPK854QLc
 xnjZhtagQcN7kckgRNHXoBjeAX9A6cY4uiMO/wvdP9zK1kTk69FBNu+nc
 6XJ7gEE7azG9JOOxra7k5sADcmWfA7b9hZq/zV6j0LVAQw9R2mW3+SGVP
 2B/Lv5Asi+bbwqH+XXeTKvJ25fDR9l1DFd/A8EBUIoAcUWOT+7WtgIEnn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7843326"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7843326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:53:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32120188"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:53:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:53:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:53:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:53:04 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:53:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mf1T7KVuIk9NEz4A4ZGcdDgozJANHyLbN3G7hb1yzpmbj0lXWsgmc58GzlyPpJIJvX97w3lTpd6vmThLbBagQHL2G59occJ6yz9/FYE/N5fiwJ6XUhDa6zFkPcyNuxRw520UUNKABW2p1WpJwK5Rtb9NJrhUj77rxLHD15nlEdGSZZWQBN+RK5SEQGshOZQ6hQ5c+y0neadfaYsfo/rDxUKvB6THb/i5Knsf+R6yqdmJ9oEx9VGF3DV1JKQ+fB9lzBS03rxreMLGkIR4A28vlilxf0jHu2mCAhvgQd1DdDWgjgIVuiAnSyZ+J+8K53CcJLnBPKRtfd13O4QGR2BD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFKFvjX8TdjplZKMlXeOQsy3D24N6effNJCqEHG1VGE=;
 b=QVHncNrB/NGWfa6rEF1oOR4y3kTKkEjmTK+ZdjZ+TZV4/dtbc3spByaucvcrJ09oTdjpOwROghbdfOeLbUfvPz+tZTExJPC2XQOLjC1gWvyMM+PFvnLyWtIosnXMzhVSqh4SSoOUUvnyU8isjp0cOlM7I5iE9fp0KIT5LRUy1KtVfO2D+39Lybm9XLVXpP7Vi0LCiU4LlCNYSGIZQf0TEMVKTRFrcAgLCEYlhu9ndKe0iB/zDtlqtuEs6gioXgx1YBcb6OyK8hf4C7jRdZATDiXYhyhxuRiMjYsaUxP5tWqDZgAxq4v3hTmf7FWfXR3n47RtAheIZBrfOAPR77g/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 10:53:02 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:53:01 +0000
Message-ID: <7c86c35b-09a4-4276-82a5-cdbff0eac3f4@intel.com>
Date: Mon, 4 Mar 2024 16:22:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 8/9] drm/i915/display: Compute vrr_vsync params
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-9-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-9-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0168.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: b1646cb9-6e4f-4cfe-15f7-08dc3c394332
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jd70zogdvrwSLvO1VrGzij+eBjbAmrnrIzOTt/siRN7afZnjEXYSCIk56tOX+Qkxj0LkRBXwzRveuz9Xw60R87w5Um/QyPZ4J//XWWxBrChBPr9YU66X3I2PIV/PEWSyxj5jWkHypQzFzRK8XHggPMceuCrFN4yngICJH/7dOKxi/XlyBEMndhUEDp0LJ/jSgo4XnhJQyoy3gRRRx8BymeqdCDG+581L6yrYvN9oCB0CqiYrEAs0lgmKS3eTaI6QV/4OG17nVazmfAV/3/pgdYK8AN6lFv4on5VCQ2es3VTe+xODsjIYzGXQ860U3xZeOkrlDIFAzWrFG61O9W6IYSzTc0xD+hF1AVXS0cPoGxD6IHRbeW77+Kjg5G30E1pY6mfWTCfhWbKH32GM17P06mrXszSyIXvxWedrLekSI8BKuVgv702wlOeEN+W2mgSkK2mAQEiNnuZRGbXqZV7zuOHLvLytMpUGVQ9VM4IekVFVI6eTY6dSnr1YFTgABDZkBQR+hixD9R0tqnoWATf4qz1iqmBbeJSprHT1YNcY6Q0AS+vQacQhW8kzTLXRNThLKaaTGoEJ4fdVlBoAWj9+DJDNqEP51FuEz8/zlcTqnL2Ds0kX6God1+JFejM0JMntFOSt2ua7z6CB4MzgbWc68DAZmaaCrinP5CZP06/F5fU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUtJcnZzelNxeHRUQVhqOWxlQmNKcVVEczFESWhMZ0oxUTl2SXlDZ1p5YmRO?=
 =?utf-8?B?cG9SK3JRQjg5RnBJSWtoU2h2Zk9FSGllSmVCa1Z0bTE5cFNyYW9ZbXI3Vy8v?=
 =?utf-8?B?Vm0yeXFJMVdnQllxK0hLQ0tIODJVaWVMMy9mMDBJZUJraUQvZE1mblZ2YXFa?=
 =?utf-8?B?SEpsTHpOYUNORFVLcGhNdC8yWFNCSVYvWkd5RU5jZjhtbGcxeEo3OHV4ZEJQ?=
 =?utf-8?B?UzlNcGNoK0RiVU5MWG82UENKMlZzeFplYytWcVpYWE0wSDlOMDcyYUpOM01y?=
 =?utf-8?B?VEhVeGJ4OU50QjJMb1ppODQ4dmwrSUlZZlM4NzVXcjBZa0o3dy9XeEV5eEkv?=
 =?utf-8?B?UGR6am5QUksrcElSWmJjSktiN1h4cGR6RWZ5dEltQ1NHekR1anBoVzVIZ1FZ?=
 =?utf-8?B?ODZRQXRIaXpvMGxQYS9oQ244SUhEY2VJaElsUWMrejJ5ZzlmbnhKdFQ2aXZ6?=
 =?utf-8?B?YkVJcXJsdisrWlZVNmtpQm00cWRRMnNpM2d6Z01USXg1UU1vYzJlcmpTdXJE?=
 =?utf-8?B?eWJ1ejBtTTh6eXhJcCt3bmV3TTh3d01BWXFnbE90Wi8xRCtldFMvWU92M25u?=
 =?utf-8?B?OS9yVjZGSm5GckZwMlQ0WlJqOXRFVGhpZUdwV3hlNVo2RFFnbmF6dFdESmhZ?=
 =?utf-8?B?UmxuTUhMcXJTc3lINnhhWTF2SmVBQW5ja3I4WDhFcEp2Z3ViZkdsa3NpcUV1?=
 =?utf-8?B?cGpJb0Z6RE5BZjUyeE1KR3M2N0ttZ3RkRDVqeHJTK25GOHV2c0phL3BjTnZv?=
 =?utf-8?B?U0tDaVBjVFJWUkYyc2gzS0FtTVFubGJUQTlianFhdm1aaFA3YlhTMWkva05H?=
 =?utf-8?B?M0xXNDgwd1k4Tk1mNktmRW9zVDVXZGpoM3FLcE5xOGxnN0F3VlFTTW9OUzF2?=
 =?utf-8?B?aEZhUkIyd3prSVhFWkhBcTRiZE85RjAwdWk5OXNLcmVjUHpMWjYzN0FHTnkz?=
 =?utf-8?B?Y0dzVnJzNkJjVEgwVHMzMzZBb1hMSE9hSnJVNEEyY21TOTdMMkFHRldlSlZ3?=
 =?utf-8?B?S3ozWURqL2hqR0FPS21GQ0V1RHV2dURYNkhUTmxFaDJWUDQ0bHg2TnRpczBr?=
 =?utf-8?B?ZkJTeGxnOG1hRkYzY3d5MmNNRWdWMHQ3WldySmJMaWowVTBjaVo2WnIxVWtt?=
 =?utf-8?B?TWNLOS9YVkhGYkJaOTJVYndpbmRpaEhMZHhrRGg1bS92N1hVeUQ2SGxFaDlO?=
 =?utf-8?B?Nm82SkpNQWM1QkJ4N00vR2NwUkNLS1M2ZXpvR3hXdVhWUldGd3MrUkcwUXZT?=
 =?utf-8?B?SVZXYURSazVVeGpoVkJHK1EwOHg5eXFpQVRmVjNwOXVMR2ZTRTNKV05OQUpo?=
 =?utf-8?B?WkhFMnRLN05tZDJ4SzZIK2JqZ01uaEEzMEVyUkh3UmZNNU0yeVEraWRMRmZO?=
 =?utf-8?B?MDQrdDg5RnNYbGlFUjlMSjlaS3pqOG1YN3Rtc0xDNUdPUG1oSFJvSmdHbjUv?=
 =?utf-8?B?UEUzYUl2Uy9KRFFHY05uUUNxN1Z6ZytUSGplMlErb0pnZ2JPaTkzOXlmSklt?=
 =?utf-8?B?UU5JWHFUZ0xjUUY2a2hrMDl3eGozVjZOQUZjQTJTL0I4ckYyLzM5L2V1QjZ1?=
 =?utf-8?B?U0d6cERpSWJTaTRtR2loSSsvSlNjZElrRDFMM1JxT3FSN2pJWXZqcDNJaGIx?=
 =?utf-8?B?WTZjaXFVa3RIb2NhQitrSlpFdE83cHBTOVVvWFNJNU9xN1FPTDFQZklQVGNz?=
 =?utf-8?B?WlkvMkJ5M2NCaHVyWlpxNmRvWHpuTldzOWFmZ3llSDNKMVpZbnp4dHByRFZa?=
 =?utf-8?B?Q1N3Y2QySTdRS0xrREtvdFhNaWxDYlZZZFFncllGemlQV3grc3NHWk5hdDRX?=
 =?utf-8?B?ZHpQaHRGcDVsQm1TelBJOFJkK09BWnpaNi8xRUZ5RnRoVHVCZjhoOVM3aTNn?=
 =?utf-8?B?c0oxbS80bk90Q1FaZ0pFcjdnTEdiMzZVQitmSjFBUnA4dkphT2hmYTJMSTVF?=
 =?utf-8?B?eThoVVN4VW9IODRxOHNyVmg4WGRCTk54eCtIV2d0ZXVKTFRrclBvbVBHOTZm?=
 =?utf-8?B?Q3QxUTkzOWlXakFCQlpUMmFHSjI5bUVyK1F6V0g5LzFpdE1ORXhvdmFNZjc5?=
 =?utf-8?B?RnF6ZXZOcDFiTkh0cGRmcGlLZDdRR1NWQWVOVGFtaXllYzFKaC9KeTNuL1hy?=
 =?utf-8?B?alhtV0xkWnpLT1NnYm9rTU1IUnBIUlk5eHAvQVZQV1lZeHdRMXhIUThjZ0VW?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1646cb9-6e4f-4cfe-15f7-08dc3c394332
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:53:01.8845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ed2FQ7aSxkRUqPFORR3cAXL8phuOrnP7v9xJQBZpeVQxLhS0vd64ttyz7vC+jz4LUBPvTkdHJUailqKR3ajCFJKaimdKJu9S7Mww7rNojX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c  |  2 ++
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 29 +++++++++++++++++--
>   drivers/gpu/drm/i915/i915_reg.h               |  7 +++++
>   4 files changed, 37 insertions(+), 2 deletions(-)
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
> index 5d905f932cb4..d24a42902e69 100644
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
> +				VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));
> +			crtc_state->vrr.vsync_end =
> +				(crtc_state->hw.adjusted_mode.crtc_vtotal -
> +				(VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) >> 16));

I think you are using the VRR_SYNC_START/END macros incorrectly.

We dont need to use these macros here.

> +		}
>   	}
>   }
>   
> @@ -203,6 +214,10 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
>   	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
> +
> +	if (crtc_state->vrr.vsync_end && crtc_state->vrr.vsync_start)
> +		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
> +			       crtc_state->vrr.vsync_end << 16 | crtc_state->vrr.vsync_start);

Here is where the macros should be used.

VRR_SYNC_END(crtc_state->vrr.vsync_end) | 
VRR_SYNC_START(crtc_state->vrr.vsync_start);


>   }
>   
>   void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
> @@ -263,7 +278,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> -	u32 trans_vrr_ctl;
> +	u32 trans_vrr_ctl, trans_vrr_vsync;
>   
>   	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
>   
> @@ -283,6 +298,16 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
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
> +				trans_vrr_vsync & VRR_VSYNC_START_MASK;
> +			crtc_state->vrr.vsync_end =
> +				trans_vrr_vsync & VRR_VSYNC_START_MASK;

Here too you should use REG_FIELD_GET(VRR_VSYNC_START/END_MASK, 
trans_vrr_vsync) to fill crtc_state->vrr.sync_start/end.

Regards,

Ankit


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
> +
>   #define _TRANS_PUSH_A			0x60A70
>   #define _TRANS_PUSH_B			0x61A70
>   #define _TRANS_PUSH_C			0x62A70
