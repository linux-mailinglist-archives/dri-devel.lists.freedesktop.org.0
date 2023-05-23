Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E8E70DF40
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 16:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0E110E0C7;
	Tue, 23 May 2023 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64B510E0BF;
 Tue, 23 May 2023 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684852314; x=1716388314;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eSmQmk18eG0taB1sN7C4pNH/QLBStQ6ZaKqPtkueokk=;
 b=d336h+5bTKZLC1A+NNwfzJaYUuUS43FEnMdnCFNiHHhkmlCK77yV3nI0
 J8mb/33+TZ/OXtxWJvClUGNIxwzqZxrPGqLDnS9QNCJ4Ps335n5w8Y0Qn
 DWSn+eBbHpMW/VTCSVQxHFWEeXysINh50ejSR1r3oucj91Ym1glfAy+jW
 zL7J4X8nCNiqtSnbRVNAWw/DLmSnYYarKn/d96/AKSaDcDWRn7dPD46iD
 h3Mud/Iv9sL5QRmkUCKukROKcgtXCuTtpPedR8VebpFQOAksp3hZGCRvW
 ap8ugfYrbkHoCZhquiYBUMAyuu+MkGtqtVEp4Sdu/tMOeWDFcJdfu2OoG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342714369"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="342714369"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 07:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="878234581"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="878234581"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 23 May 2023 07:31:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 07:31:44 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 07:31:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 07:31:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNTIvSuIGMd7JzzgECwWCbJ0TqNmaxcK2PL9Lqon0eh0ra7CE4hxEznSB9qTCK2W83GbUb9QN+x7YCUmziCxZ0qxTLPmk25SuKREbnegwNmNkStkmhUg4dcng2yyLk+W2RC+bKq9DU5B00mkmqAF6QnIxyCd7AET3whDdUQ7K4aNOQELbt1oRjxb/XBdfA95qfFnhl7CCiJ2IsVRbad57ElnyeKeaZ4fOLwKJfVAu2FI/2iTqvRtDcup8asfJ2a+VKeXYkxAA6UmPWMd3EAEjtnsexkRpsU+XLwCVz8hQ6R/0JaPCsbjTmNBQCDiH2PvuQXv8QBDX8bOwFYPBYcWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlrCdkB+CQw+NDJ1G1oEUCkoVlB85AZlK7QK7iwHxU=;
 b=B6KoC8LP+Rm+O6betnSyWHoXRN/3GnPTIunqfuam58hKrObnUQmdCqLVxj74mCzxgkXpR/steC18sDyfghlVlhbLY75GUbruDVIR7sF3QzhUMZmxCHsahg0qBvGWkRmls+eXrkwfjqQ/cBmNw91+rcdcv6WUg1892i5pX7JwB66x3MSkgyYFyuQnwXkrh0lrsEMoiKSPwbpBEf/fqTSOvoQktdjEs8mSR5Gpn/epE+fUDC4kSneVEem2f/6I+gRNYMbakJRrcRIEOtHhsmX/r8L41ioakUmc1Kkfn6iJiiIf+YHN8F2koP77jEL5mcC7KmxZddOyUsMhhK64yHF/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BN9PR11MB5559.namprd11.prod.outlook.com (2603:10b6:408:104::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 14:31:42 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::ab78:f580:c203:edb8%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 14:31:42 +0000
Message-ID: <ae490e97-4ac0-f2be-6381-50a86b426df0@intel.com>
Date: Tue, 23 May 2023 17:31:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/i915/perf: Clear out entire reports after reading if
 not power of 2 size
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BN9PR11MB5559:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b6e6eb-fb16-4b3d-8daf-08db5b9a6d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMn6YNWvd9MMOeVpMgypxMPb14kuHA+NB2YDU4QnF/o92UVONZ7fdn8XMJrqmTMSrROjtJOCoqax3MA4e+LpAEJqQmB83LMn8CEItMkLdw3NqhdeNXkioqidDYuGZMbKuueuuy/AdlafAuvHWIwQp7sXVUXhyTrVnFN+xpl7DMktVzsGF6h3eWJBdKvm84d67WZ/OcwarEGl1bxSumJaHjQRhIinonE36JGJU0C+FIwP3oIsf/bGvDl0Y16qJLwNTtnEi8MM7EfSQhc7wVAOjRv9TEd4H+TumqNmpF82rHSNuCNJd7pkOXxc1Br/27E2lXG8Dwk12zyoFCzB4+6nBG7cBk+tIJNnY8vwNdw5nz2ofOGkBUdfTyKr7emKFvR2u3M4qtPlnTHTS+C0MT19SHdLD+CbE3hWBCmj+t6uupgkqWA39u1oVM90adABBXFwsYYXp5pRvJMM0yO1V4UN8PzPZAhozj8iwUG5iBD+2cYYOKjXUC7euZ9IgbK9ZOD0xbiyN6n71FttsHbjP1Y1uYjfhuzoMlkf1H6Qn0iebkY4psFDDWOUE8/i5YW43CDR1b000Lhit8fYRzt41b5axQi8Yv4xCz7KeVLxivCDXE8cJoTSpBom7XL6o1/RtTvgQUMlPXpzyDd4egnIjDO5fQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(26005)(186003)(53546011)(6512007)(6506007)(82960400001)(38100700002)(107886003)(2616005)(36756003)(83380400001)(2906002)(41300700001)(6486002)(316002)(31686004)(478600001)(31696002)(66946007)(66556008)(66476007)(4326008)(86362001)(450100002)(8936002)(8676002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpWV0h5RkVHUW8rLzYvQnhXWGVEZWdtSTZLNFRrUE00VFpsQm5ZbXlqNTFL?=
 =?utf-8?B?ZWI1YzV2R1c5bGJDQWNwRTJYL1grdU5JUHAwaHc1WlZKb2dEcmtXNE1hcXQ3?=
 =?utf-8?B?QzNONVdDVFlpbklRTFZ1ZGE5WnBiRlFmUGhpL1BaaTZwUEMyaDI3QVQ0QUxo?=
 =?utf-8?B?S3JCUFViTGhJSFBma25HWjNLUUZIUEhEc0gySHhPZi9vdmJzbm5FVEVIb2hY?=
 =?utf-8?B?RkxCRm5wLzM3QXdvT3hxODN2N0MwRStUa2paQ0kvQzI5RTB3RFJXcVVobWVz?=
 =?utf-8?B?MlZ5ajVVZzFCUTFtbWQvZzBEL0gyRDBIWlI1WU55YWg3Q3kyT0VRWldoYmJY?=
 =?utf-8?B?M3ZoY25yQVJGWWgxNmhuVmVyM0cxaHV6anAya0MrTVA4eWphb1lpSXIxdnFD?=
 =?utf-8?B?UUtNME90SHFMaWw3OVpXbXVVRHM0SFp4OXF0ZisreFkwcEkxNDdqa3FEYjh2?=
 =?utf-8?B?Q2hxUXNhS0Z6ZGRuNmlaQnpGYW9HKzYyU3hUclZhMGJmU0Q3UzQyQXJxbzFw?=
 =?utf-8?B?ZmJlQ2xJRlFzYjBEakxVcXQyTG9OcEpIUi93d1cwRERGMEdUcGhTcUg2SU85?=
 =?utf-8?B?ZEcwWklPRm5YbjhKWjlVSTRlNUtSRDhiazA4WEtScjI4M3dLNUFFc1RmZ0du?=
 =?utf-8?B?RzYyOG9sUVoxYXMwcjVBakZULy9FV2orbkw4WlJGcGdYQmNHMUJycnJGVkto?=
 =?utf-8?B?VktzVjJadCttQmhuOERGNDloN1NiU2w3Ny9mbVRKWjJDa0lnNzJQbjU1VGg2?=
 =?utf-8?B?UjJ6TXRYRnhtclN6Tnd3bjgvRkZ0K2tDWDhTZnRSWGwrRi9Fb3A4ajBESXMy?=
 =?utf-8?B?emNoNVg1MXNGd1hEK0ZUUi9lZGx1RXphTWQxelRSMGlRdnZYLzljTWxkdUxM?=
 =?utf-8?B?RVZNaHQ1QnBhWHVyRG8vVHVacWZDM1I2b3FvSWVZbnBKZmVqYmVrd3VDK3NJ?=
 =?utf-8?B?WnZxT2VpSUx5TXJGeG1USWY3Y1BuZWlpRENqaGpFK3BZUUNldC9OZkpuSTNJ?=
 =?utf-8?B?WkkwRVZ4cmdmQ2ZvWXNWL1FrQUY2czBpR1JJcno1Y0QwVkpsR2dWUzA4Rmp2?=
 =?utf-8?B?QklGWXNocTJaRlBqbU1xUVNiNEdnSGh2R3JkaHEwTmxmb0djaHFWRDFKTHJj?=
 =?utf-8?B?Z1diVVcyU0VFNkJWOHpXT1paQXFLTWJGVk45WlVSSmRLaldSTUxEQ2I2S0pU?=
 =?utf-8?B?QTNOcFcwZUlubDZzcWZNSnhJWVJ3VTFlMTRKa05iOGdwUzZoSHliK2xackVF?=
 =?utf-8?B?MFNyaWNZR0lQbC9rQTB5eW1EYm1JUFF1NXRHNVlpU0xSanRGRDBIYVlwazVr?=
 =?utf-8?B?YzNMYUptN0RCLzhHWEUzL2Erd3NKUnlxc0FCTVB0SlQyVGNtSE1DSjhCUXRB?=
 =?utf-8?B?a0E3RnJTa0V6QjVmQXFVRThncWx6NDdOYmNCOE5oWE5aQzdPSUtYZFNqbGZU?=
 =?utf-8?B?TE56TU83ZmxQbjF5QS9aOEJoSHhRV0ZYNTZ1U2g4L1JwVlRkVi9sL0FHYVph?=
 =?utf-8?B?VEdzMUxZdlRDQm0yeDhYR0NXNkdqZzFlRS9BclJneU1qQmlUSTh4T1lhVVZE?=
 =?utf-8?B?QjczSVEweFU2NHlhY1Nrd0hBdkQ0azU3cDRLVGVPNGs3SElneFlUeDVMOVlO?=
 =?utf-8?B?NURMbkZTaDN0UlhLWFAvdVBha3JHL2xZVmV3aGdJZ2JxZlFpbU9xQ0UvQ0dh?=
 =?utf-8?B?Z3M2cDl1Z01jZGt5RGppTlBYRDRmdU9MUThVZkdtZHpHK1UzcHErSU5Belpv?=
 =?utf-8?B?Vlo3bWphWCtRV08vQXYrb09KTXRoRUxuakJ1YndGUmpVMmZMNDZlK2ZCV0tl?=
 =?utf-8?B?ZkVCSEpkc0JISDNtdXlPbjUwdXRKamdjb1A3RzRPa0RmaWVxQXVBMUtaQVda?=
 =?utf-8?B?bkRYTHNjZ3FRclR6bTVGOUVhRzF2anNuVTZ4cVJLRWJha2h2eTRpTEV4Q05r?=
 =?utf-8?B?N2Z0NGxDQldrRlF4bEpzYlltVzMzMzdWVlNWa25RbGxNT1kvOUpUdm9pL0tp?=
 =?utf-8?B?S0IvVlo1YlZsaDh1REZaV1lUeHhtMG81aVVXSEhrTXlMcVRUcnFpTmJVN0Ez?=
 =?utf-8?B?VTRmSGFiY0lqOTJYSGJtSFdSMWNGV3g5MU1xVW9ZSWhzU1F6M2M4Tnc1SzNo?=
 =?utf-8?B?NWNTWWo5UW8vT1o3TWJvSWFheFY3ZkdOUmxvM3U5YWJ0UHN3UU9sNC9lOEo4?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b6e6eb-fb16-4b3d-8daf-08db5b9a6d94
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 14:31:42.7585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/tPruwkN1Smvv6vBa352ajB3v3zX3wHrOD7u8z8LdCszj0/89bwhKieqR4YkBBmc8iFJf6r+juu8C2rQqs6BpGGk6vggiSyXg/LoJa1e6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5559
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 23:17, Ashutosh Dixit wrote:
> Clearing out report id and timestamp as means to detect unlanded reports
> only works if report size is power of 2. That is, only when report size is
> a sub-multiple of the OA buffer size can we be certain that reports will
> land at the same place each time in the OA buffer (after rewind). If report
> size is not a power of 2, we need to zero out the entire report to be able
> to detect unlanded reports reliably.
>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Sad but necessary unfortunately....


Reviewed-by:  Lionel Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   drivers/gpu/drm/i915/i915_perf.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 19d5652300eeb..58284156428dc 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -877,12 +877,17 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>   			stream->oa_buffer.last_ctx_id = ctx_id;
>   		}
>   
> -		/*
> -		 * Clear out the report id and timestamp as a means to detect unlanded
> -		 * reports.
> -		 */
> -		oa_report_id_clear(stream, report32);
> -		oa_timestamp_clear(stream, report32);
> +		if (is_power_of_2(report_size)) {
> +			/*
> +			 * Clear out the report id and timestamp as a means
> +			 * to detect unlanded reports.
> +			 */
> +			oa_report_id_clear(stream, report32);
> +			oa_timestamp_clear(stream, report32);
> +		} else {
> +			/* Zero out the entire report */
> +			memset(report32, 0, report_size);
> +		}
>   	}
>   
>   	if (start_offset != *offset) {


