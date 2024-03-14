Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C4687B9F7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 10:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E3D10F9C4;
	Thu, 14 Mar 2024 09:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D9yT+Rzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA9110F416;
 Thu, 14 Mar 2024 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710407065; x=1741943065;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/5RCPtkL5u3Z/TC/GxX7E0vKN0UN3b2lXoLzfzqrkfk=;
 b=D9yT+RzzHsfLNpt/v1UDs/rFJQpo9OcSioJ+RmxFC4yyVfSgzz7sTkfZ
 xkb+ib0O6Tp5ow93EwxTDL22xSkvUOl0Crk2F/L7Cu/o2Ls/fGk+D50dg
 GHGGnL/6lfR20inQLnH13KY8XIWZqcTAIePl38ZT8Bf4ofE8UBzK52Ac5
 1i+fEXuE4DB3/Zf+yFYvaVIbjI13ctTcEYY3Q0Z2MLX9zmX0jhaUx3XPV
 oePu6GKeqmwX2iBHrAiIK3NsqjVP66mPR8P8iUzfzZxd//FvJ5d0kqxG5
 BODO3hTBoJxsaqVVwtZUaXByJbJGvWQVjWXSIe2FXwn+QWQNjbfIGQUSA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15854941"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="15854941"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 02:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; d="scan'208";a="12805994"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 02:04:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 02:04:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 02:04:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 02:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUZVH6kf23bw45g+Xyrpp1kqwudjsEfLpoBPRRtb1F3zYUZokJlFNmX7h11mx/qHT9vq+mmg0OMSUGWVzp9QsT7YFbGKSK3qzdvcM1JEJiwYkfRB4ahuTk0JHFH2d7yjwqMfGbgV4JC3KIrH0/XV/qVVWCGzRe+T89kWYYp/iyZEZj1OP9fV40gYlcgKdJtWlAnM0XC5OaByVAE6UNJSHf4k43FppqG3M+8wfeUO8bK9VhDcR5AzvZopf1KtcwvC6xgMr9Jsr/p6ctcFHvvLjptp0JTpNgW5vaPZSWJ6FCsTqGfq9XiKI7J33bFmq9vt9UgfruN07kiNfOX6SW7X7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0Dp8wRiRu84hcFcI5pmwdEY0iR3L8/zQbjFGNd9rZo=;
 b=EyRrQd3P3DvBrbFeFDx0mVk5233+vEH970brPdjnhpSx8cuz7f5/ZxcFfEHo1hxZ3fKbiQ4sQupnJxAgkAtTrf2Sa2CRY7c+wT733lFDUtN+eKz+HP0pL+L3SlxS4FDmwQNvZDJPEJeQA1Q105e8VPDM3z7vQQco6agSU8K1vz1FuktXNbQOqcHfe3vGRtDau1aEu/+BGxZxWfVEisIHcTh5gut0O5nPpixgTBAX6NP0aMZKsxxQPQZ0YRkWJWlsEyVUVjRi8wGZwV8yRYCwXIpKEnDB80YruDTU+T1+D8qMwRyDUpbIKWTpOjiXDFcI66PjeZIpRF+Wt/wYjhUTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 09:04:19 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 09:04:19 +0000
Message-ID: <71f9719f-074f-4343-82b2-063dcaf00d20@intel.com>
Date: Thu, 14 Mar 2024 14:34:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 8/9] drm/i915/display: Compute vrr_vsync params
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240311094238.3320888-9-mitulkumar.ajitkumar.golani@intel.com>
 <20240313035625.3339996-1-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240313035625.3339996-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d612d52-3cdf-4fef-2b8c-08dc4405bba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BEJTJs70hv547QNBLZd8FiFsM2x5nj228eQ6Jz9KgYDzIfkWVlJ7ltFESxWuxRENZA42sChNNdP3eg+W1Zd5XTgwOUW5cQHkoAEaqgbVUBluDVZBIlYzXiYYWWL8ut0LYTR8NlA00qMLKnssjUHrF/ury/oP6U8zBx8ADDWHZ7wazf0D+0BG3NJG+fgO53495CIQqT16SnRrp7Z52kWJamnM/QlPOooc4W3ZooyZsPhH03tqi7yjOPBtq9t+3fQUYiuq4xOVldB6jpBm5KLBc2SZJL74IYEH9D0wRVFa30UrtB0cIxNJM3II+unVYu9J6jHuMx/EVxuN38cYj77U3ShwA4LDl2dmdGxQXQO6JkhbrQHGMDV8N7iuEqmZ0FV+tJs/7f4bC5alyifC3ACVMJ8MSZLuf2o60DHQoWaq4MzjkN1B30xC2xf49p9h+ZExQyfRRYH9nFh8fMza9vdMvn5lj9rxlLOUjsmZsRA8auiqLh87pmWWM4pevCwx838EXGuq1dQcD7U86o5mTCA7P8lY2I++JFWqLHv02xz1GAwhsHPivKBvPN+aTMZAkQ+Xq13itp9VYbqnObud8CRN3pcYUigve7TfSTBeclMrABQEDQl0QkZ+sWUWQK8G/ywT6gBKiLE/8RFCwOx4X49wPq1GSryypAAyz3fLevVZ38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlyWmJVQTR0Qks4bmt4TWlaTVlCclhIY0cyYkREUVltSVZUNWlNNzN6Rnpu?=
 =?utf-8?B?bEpsVEtUTm5scEZNMWFHMWpyQ1B5eXZUUUp2aGcvMUNsNG9qVHFrTCt6b09u?=
 =?utf-8?B?STNNeDI3aVBSWUw3MWFzUGlucS9haTNlaVpuOXZoZ1lndDNCaFhsa2QrOFNq?=
 =?utf-8?B?SEFrRjdYWERnNDZvL0FyakU3NkNaMGhHeVVDZnpFSmdLbTVpVDBFSjd2NWxN?=
 =?utf-8?B?bnNJR1BHSHl0OEZWbVRBRjVkMHhUUmtndk5kemlrbFFjNHRwdXdyNWFSRk5y?=
 =?utf-8?B?bjl2RGRUbGcxbmRlVUs3VFpIVWdxRUZrV2EwWVJXakNITDhLRU8wMVl0OU1z?=
 =?utf-8?B?SkUxdmFoNDcwYkl4RUR0WWs0S20rbUZqdTRGbmw5REJlM0lrdWZsaHJkZnhZ?=
 =?utf-8?B?aGhYM05yZnl6dVI5a3hQUE1EOWZ4Y3Rwa2d6emZVRHcxYVBrSHcvdnJkWE5K?=
 =?utf-8?B?SkJLcjZNRzhHMXB3cHkrSHN6dERMS3l3anJpZG1tYXZyMTZZV3pJZ204djNp?=
 =?utf-8?B?eXRjcnRPd3BnaTJ6djdhQVlVZFZ3WE9sVjk3VFg2TUJZcmhFTTMyZldRUWlh?=
 =?utf-8?B?aVExTWp1L05RWUx5bWpRTjc2SGRjSDJQOHd4am5tUm1XWnl2cDhFOFpCMk1p?=
 =?utf-8?B?eEp3RlNNbG9TM0dmcUNMMTcxWnZ0NTE0S0oxZ2xHK21zNk9zQ1dXeFdJcWd1?=
 =?utf-8?B?WGRNL2xkZzl3RlRVSktHRjVIb0dsOXBNWWp6V3NFZ05zbElXYkx6VXdoZmM0?=
 =?utf-8?B?VHlFc0N6MXh6ZlFvRGZTNjFlbytES1pGWE1pZENpdnhkMjJYYlh0NnJwRFhT?=
 =?utf-8?B?aG1NVmltUGFPUUlNa1JBTTIxWktJL1JxbEFOSWtzUjdzSm91TURiMHNxSHlU?=
 =?utf-8?B?cWNIVno0UVh4aWlqKzlqWjR5ZjFJMlkrc0tvOFpZUVpJeVlpcFJuZTdLdlp0?=
 =?utf-8?B?aWM3bXhpeWUvcjV5M3BkQk9tcEs1WGt1SDBiOVd3YUxPOHBvTjg3V1g3VStL?=
 =?utf-8?B?MitUL0Q5R3hoa1NiandlRElRcVpPQmVsNklQQXcvdFdGMDFSZnVmd2dOTm10?=
 =?utf-8?B?Q2ZwRktrZVVLVFBvbjV0L2NPM1Y4TDRscjdpV01sZ0ZPdjZtaVExZUN3elJx?=
 =?utf-8?B?WHpWaXgrZTVYSUNnSjZsQmpNV2tiUjN5eGZvdzl5ekg1SkdvM2lJbHlZajBa?=
 =?utf-8?B?bEhsbGdwVGNsRko5dTJZanVzaHhNUG9laTF6aC9STUI4dGZ3aWlLRUlkY0VY?=
 =?utf-8?B?enpnSm82UUNzd2lNQzlFaVJHcURydVJWejJEZWNDQlNEaHMwUFNxN25DMzdn?=
 =?utf-8?B?Qk9ITGZQanIxZUtkditWM0R6djkreklNY1UwYkhMTWhlbFVDL1k0dk5ra1Yz?=
 =?utf-8?B?aDBWZG1JTExiN2NYRENvN2oyVS9icG5jdFVvR1VVYkFkQ2ZTOEEra2RlcHBv?=
 =?utf-8?B?NXFpaTJ3NmN4anlDREZXK25ROVZSWXYxNlJpVWtodFFxajVDMXpHUko4V1o5?=
 =?utf-8?B?emRzbUNmcVY5NXpPSXR1MGk1TkdTc2ZzT0dpSGlueTdycEt3ODk5N2Vac3Bn?=
 =?utf-8?B?aUUzOHJQL0ZnZS8yOTdYSGNlZDlNWkNyUlZpelgxSXlDcWlYSnpUeWtIY2kz?=
 =?utf-8?B?VGdrejJYQjlJZVNvcDhLMDBldFR2elBmK0haRk1IOThYL20xQTZ4aTB5ZjJE?=
 =?utf-8?B?MUFHV1BLc0ZEWjhrNC9VamIycjk2L2JFNkd2bzVERzZzZHBXbzlpblF4SnYz?=
 =?utf-8?B?VnJQUlZOYkUvRUQzNGpnNGpiWkpScGFrenBqSGhlRE11bWZianEwT2lqODQz?=
 =?utf-8?B?cE8rUkVob2pUa0lVZE4rcmpBdnNMaE43UklLT1pGUGNJbjVuUHp2RlNvRW1u?=
 =?utf-8?B?R2dOUDU2Z1ZRN0pNdE4wTERlVEtZKzFXVitPb3NmTTVuTDgwdGNXT0RXbVlp?=
 =?utf-8?B?YTBvbjBXQ2o1Z0o0cG1wL2dtemE1VHZ4R1lGQ01xNlcxMzhMR2l2cWxtL0VE?=
 =?utf-8?B?bnR6VzBTcTA5aXY1Rm9pUGN1TVJqaXRFWXNTaEFQT1ZlTE9TYUFEZVJzUE5a?=
 =?utf-8?B?MDJKamNSL3pKQzBIOXpwZ0J0b1hhd3VaS2xwb3NDM2V3eUU2WmM3U29tVXpj?=
 =?utf-8?B?RThnWjRMTjBza3RmY01aWjl1MHVuY1dGaXFJNE9vVjNCb2I2dlFzNnFJSDBR?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d612d52-3cdf-4fef-2b8c-08dc4405bba3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:04:19.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuKgwGoi3hjufMgn0BNaGVgoSODCT0qK+phKPdi19O42mYL+TzrNFzjRoIMkrM418qAjAe0YQY6FrV17UEJYtcLAbvYJPapt5GLi9NHKgpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
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


On 3/13/2024 9:26 AM, Mitul Golani wrote:
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
> index 8f1d948408d3..fed4ed18d53b 100644
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
> index 8a286751dc39..c2e08f641989 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1430,6 +1430,7 @@ struct intel_crtc_state {
>   		bool enable, in_range;
>   		u8 pipeline_full;
>   		u16 flipline, vmin, vmax, guardband;
> +		u32 vsync_end, vsync_start;
>   	} vrr;
>   
>   	/* Stream Splitter for eDP MSO */
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index eb5bd0743902..ed38fee196b8 100644
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
> @@ -204,6 +215,11 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(cpu_transcoder), crtc_state->vrr.vmax - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_CTL(cpu_transcoder), trans_vrr_ctl(crtc_state));
>   	intel_de_write(dev_priv, TRANS_VRR_FLIPLINE(cpu_transcoder), crtc_state->vrr.flipline - 1);
> +
> +	if (crtc_state->vrr.vsync_end && crtc_state->vrr.vsync_start)
> +		intel_de_write(dev_priv, TRANS_VRR_VSYNC(cpu_transcoder),
> +			       VRR_VSYNC_END(crtc_state->hw.adjusted_mode.vsync_end) |
> +				   VRR_VSYNC_START(crtc_state->hw.adjusted_mode.vsync_start));

Typo here, need to use crtc_state->vrr.vsync_end, 
crtc_state->vrr.vsync_start.

That also explains the mismatch in bat-arls-2

Regards,

Ankit


>   }
>   
>   void intel_vrr_send_push(const struct intel_crtc_state *crtc_state)
> @@ -264,7 +280,7 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   {
>   	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> -	u32 trans_vrr_ctl;
> +	u32 trans_vrr_ctl, trans_vrr_vsync;
>   
>   	trans_vrr_ctl = intel_de_read(dev_priv, TRANS_VRR_CTL(cpu_transcoder));
>   
> @@ -284,6 +300,16 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
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
> index 9bda3a24cd94..9512f4c58094 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2095,6 +2095,13 @@
>   #define   TRANS_PUSH_EN			REG_BIT(31)
>   #define   TRANS_PUSH_SEND		REG_BIT(30)
>   
> +#define _TRANS_VRR_VSYNC_A		0x60078
> +#define TRANS_VRR_VSYNC(trans)		_MMIO_TRANS2(trans, _TRANS_VRR_VSYNC_A)
> +#define VRR_VSYNC_END_MASK		REG_GENMASK(28, 16)
> +#define VRR_VSYNC_END(vsync_end)	REG_FIELD_PREP(VRR_VSYNC_END_MASK, (vsync_end))
> +#define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
> +#define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
> +
>   /* VGA port control */
>   #define ADPA			_MMIO(0x61100)
>   #define PCH_ADPA                _MMIO(0xe1100)
