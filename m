Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFB75F61C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 14:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776A810E2E7;
	Mon, 24 Jul 2023 12:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E7010E2E4;
 Mon, 24 Jul 2023 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690201171; x=1721737171;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dNj7MES6DiWmi3UgblV3YZSRxnSSomlh1anrUlvi85A=;
 b=jbTYvEU+0wIgdMTrEVSh8qEIo8UkI1XY6BJSibv9kB710SxpYZwWcoHC
 ySFRtG7MchTGVt1NfSPeduQ2XplQYfcL6IR+UKXw0u7KZJyCONUyaNs9R
 UxeT+mO8nF9omWaOfrctKbSGZ0Jw/GZPFEp6yDZu6kG99gjFI8ppAbITw
 It6NjfgpoDjMW1hTa+9vPthp4P7DSfD7wTu5jdv7sydNPFAMhKFaHGdd4
 fLPWxzCXb5xOhMzklEQ7nCLUQMY3JnN4A8G41DsJetYqZ6CM4nQiuUJpt
 +f7ct6UUL+Sm8FR0v1GgOyIgGY2u12xzIFhE6+cAWP6rPnR8yys+krM6p w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="347027593"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347027593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 05:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="839431577"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="839431577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jul 2023 05:19:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 05:19:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 05:19:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 05:19:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 05:19:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFH7eg4hFOmzjGmb4qgqk6fIorcOOhjw9QQ3jfQf+ba0XneSx6LWkL4AfiLuCDFENDYcf7ifhDq0/rPqKXRLh9ou2R0YPQnCjYws8m9J8QERrxmA4p2Y/1JFht+vXiXId94jihoS2xebAYVZu07G4N4mc24MfSuqPT+BYejA+ZL6Bmg6qW0y2WqqDCnLz0+57uE7OVJ+s45Yyixl/fxVjRCynkUJhtnOyKUsCaB22NDIiscq533OIqUd0WI0lZSw7HURaELPL8vSEY6qBpJoOHkI7eOaceJiNf3bTH74Akyq7n6BfjALZB4bkTlIKNnQMtD9YIBT5fBTNTbBHAE64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH9QHBqBIbjbLd/sw+HLQl1An/p657P0epSkGj7P8JA=;
 b=lQ+bgYH0+11xuKphCcGKO00j1RqGaqoCUIr6Anm+r2lvVSGjSNjMQaj5tpnMyGy83nn64JPFm4GZtjkvVGe3Yv2unm+Ff/MgyUgRVbNWI8RDsVB/ytgftNQrhXu1Jo+828ERVYnw9IGiyZf+98wifTt2NGg4bomQ0vHl7DMh2o4Nvuju6uhgBHpRZMCtpiwxA2M99BbJrTa5NjMHjbePJlEyzDUA0/a2/xHbrTugEXIOdxnVLktJeU/LfphYMu+JvO6WLCAM2CwVsx0HpSzW+zM8gkVOiDgVqOo8o4Fp0Sqx8ysmO/jPhLlz1WypDZP/cqr9/MgCumvhjgCxrfqrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Mon, 24 Jul
 2023 12:19:23 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 12:19:22 +0000
Message-ID: <65cb4383-ff7d-f7b4-29b8-4d81fbe076c7@intel.com>
Date: Mon, 24 Jul 2023 17:49:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/19] drm/i915/dp: Update Bigjoiner interface bits for
 computing compressed bpp
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-6-ankit.k.nautiyal@intel.com>
 <ZLj+YEpuQMDcogN4@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZLj+YEpuQMDcogN4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f2c584-f997-4522-f91e-08db8c40367e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cfTc9+Xe3Y9+0BB3fwr5OcH+2jB5qqVQxFEifSzsC4TnBhQS6tBrkI29FyaeY21vRgYbKem2k0HHNFevuhBwEUuxIgaAr1byXphKNmIIkEfK59whUO+/upcuhO6+nQfMRqctrad0FNW/AvJYN3Eg4Ehka5e04QEl4RntcREBcUrLDb3ago7r9Kgjoeir0BXzJSQhN6zOceU8fW9vHVcwpz14hbEb9oXKDWHJx7FGZrNdUwGuh+qnm+FwhuUgIOSjAY+ipo+9+7ANkohYZnxZ3aPkzdb7kij5vRhhQkti8P7XuSFAxchgc/tS05NpVgwM0oKua5M4hxbZaAH/C8CIocqj38IpwE2xM0w2j21pWDMqDM4MyRXhDVTvOZClfHtT7vgZpj9Df15BtERgoFwBhetBsfYOElAZSLC8zo9ihsFZsfmHRE5yUoE0VEjG9OI0l6PxtA9rTTGbbROQreFVK5VlwFMUu+WTrOYAKyy9ghZB24m/WJDu9foHEHrCcuOXiJD0W26jCsUrHimZzefT9iZBoJNuizLSstUnYXQYqcz7wCleQnd5KIsW5ryOdoSdTsFyL8Qp0NR7L595cHVKS3f156QNO6vSGrTLCBBxLjbMS1u8PivwfxS4M33eTVEuDcQGQ5cMkVAY3V9kBrZz2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(2616005)(66574015)(26005)(186003)(6506007)(53546011)(55236004)(83380400001)(66476007)(66556008)(66946007)(316002)(4326008)(6636002)(8936002)(8676002)(6862004)(41300700001)(5660300002)(6486002)(6512007)(6666004)(2906002)(478600001)(37006003)(38100700002)(82960400001)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE8zZXJOTHNXMGFtWlFpUksrN0VwRVJhUUJSc2libHoxVi8vOSswZ1BFM2pP?=
 =?utf-8?B?OEFnYTRZRVpwdHdWcEl2Qk0wYUQ4bFlpNmw4ZEw1UmE0SUFSZVpBV0ZTVHVJ?=
 =?utf-8?B?Wnd5ZjI0Tm1BZ2VHOHJuNEdqV3dhaloxT1pkUFM3em0rV3hnNnRuNGRINmJC?=
 =?utf-8?B?YTNkRkxWbkEwZU42cVJZSVJaeHg5MWlSQXNveE5yNVNuQlk3NE9qSSs0K2VW?=
 =?utf-8?B?NXQvTWxLM1Byc2dQdGl4a2o3c2o2QTNUSFhIQTI0QU1sa0tTaFNBaGtWMXli?=
 =?utf-8?B?ZllnU29EVWo1MHpzVVBDK0dDanh5NUxSeG8rVnNoek1OaE9WeWQzQ0w0aEQv?=
 =?utf-8?B?LzZTL0Y2Z3laaVl1R3R3ZkQyTEU1bmVyV3h0THpaN1JUM29hNzdoc2FGdFZU?=
 =?utf-8?B?TEwvcVhsQy9JQVJLRHFuQldKS0tMbE02OC9DSnp2NUJsdVhHT0dZdEtHSXhV?=
 =?utf-8?B?dml3VDFnbHBpNHBTYnI3NWtXOUpjWHIyb0NjVWRXVkR6b3RtWHFzTkJ0M3RM?=
 =?utf-8?B?SzJGblRxSFpnV3dsQ3hGekF3MXdrNWV4WDFGNHJWWjk2clFlZVJvQkJ6Sm9J?=
 =?utf-8?B?cU4wVjNHSmxPNnduUG93cFVYNUtFaXhwSXRORldRSjdQb0Fxa2pkRTI5K08v?=
 =?utf-8?B?eXZmdjFsNGV4di85YUpzMU4rNXVLRWlMQU1PSWxYc1gyK0RIVG1BN1pUOUxt?=
 =?utf-8?B?emNlWGtKaUFva0RaYVVzY00xMHI1WGpHazJpR1ozU3g2M01YTXFLbHFwcllM?=
 =?utf-8?B?aG01bmVSdHBaVnREOWNnVXZ0ODlsR3FPcXR6K3ZRaWwyOE9URjNpZFBUR1ZP?=
 =?utf-8?B?NkR5aUh0dnJXdUcrNmhVU3V4TDFpUVNLb0V5MUQwdE10Wld5amNpNzZMckZ4?=
 =?utf-8?B?aXR3ZkZOQTZHa2w3eHBwWVYzUE85OHpYUFhuN0YzODBqckVkbUdpemYzeXg2?=
 =?utf-8?B?eitlQUloMWh6YUo1YThVMXRneXRaM2JJLzMrVWRZR290WFJkd1Z5QXB2Y0lK?=
 =?utf-8?B?YTJ6QjVoU21ZLzlBVEc5akxaRGNCZDErVXdVVS95UEpYRnhqN3ZqS2FhQ1BI?=
 =?utf-8?B?RWJtTEpnUDhjZkdBR1JGckF2WjdkQXovY3l1RjZ4d1NSOHE5WVhsT1pIK0Jz?=
 =?utf-8?B?M0ZuQzlJRFMyeUlPN1V0ZWtkU0R4OXY0Z05NUHdsc1k1NmZCQUlmajdZRmp6?=
 =?utf-8?B?QTlCdU1EZmp5Y3d4ZXpxa1p3Y1ByM1dCUUJaKzNvTVp4c1R6M3hzQ3BDbjFO?=
 =?utf-8?B?bFdKNjJpZjNhaWNOSWxOSFlCOGIzOHVxU3dqM2E3VU1zOGVSd1o5VVhNcU5V?=
 =?utf-8?B?bTR6dnVmZDVaMHNJeVF3b0xwT2MyODYxRWppK3hvOWZGazZKcDROM0E0VGtw?=
 =?utf-8?B?d2pGazlENWJDbDNscWYxYkF1MUpNbzZFbW9DSmFDWW9ZaDBLU2ZwOVRRTHBV?=
 =?utf-8?B?UHRibXV1VWt1QlNvcG1DaWdHVnRORmRLM1pVbTFBQmxTK0J3VTlya2U1NkxK?=
 =?utf-8?B?RTROSmV3OFkwOHhwMVJIT0xBVitGaWYvSWVlZ2JqMkVMWmJxcEVnOUFqZTFX?=
 =?utf-8?B?ZXA3RnpBSzdsTFczelRYcXA2RGlDYlFCSlBNUnRCT3RCdlAzYS9nSk4xNFJZ?=
 =?utf-8?B?S3dSMGIxSys0MUd0TFZsQlBEK1ZkMVpoNnRFaXpxdkpVamIzbHIzUWMzVHJO?=
 =?utf-8?B?MDZLVHJIdVlEQXhORWxsL1A1KzdxcEw4UGpxc21GdWF4SFlRNXNseVlSN2lM?=
 =?utf-8?B?WW1GcStoR0k5Q0ZzMTVhQW5Jb3Z2Uks5ZUFrRTBraUNFZkg3bzJxaXRYWEV2?=
 =?utf-8?B?aDUvbXVyeTVGSk10c2xaeTJ2Q09raGttcFRZckRsZ2J3Z081aGxGZW5uUGhS?=
 =?utf-8?B?MVNIUWVzR1Z5UzFxejE0VTFUV3gramJyL1BESmt6VHVGRUU1SFArNXpnTkl2?=
 =?utf-8?B?Z0tzTkI0bHg5WTVRZFoyWmVDQWprajQ4SXJ0ekRKSG12TXdVWHRUQzhCb0t0?=
 =?utf-8?B?bnIwZC8zeXZMZUZFZTltbDE5Nnl4b2E1YTNhZWR6UDR1ODdRa016TnhiVHdS?=
 =?utf-8?B?QjdmcWs0MWM3SHBjNnpYQjJ1bzlGSGtHVUszWi95blI5elpYMWRvNlAvVytI?=
 =?utf-8?B?VXBXR2RvNGdrb1NYdGdhMjYyZDRKalBvWkhZSDZpOUtqNDZnWnNvMHFQa3FK?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f2c584-f997-4522-f91e-08db8c40367e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 12:19:22.7266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yp4nPKK1qMCjj/ug3IbHVsVstNf0Bvbv31QK3cIHjvs6PJFLnpVr1/wyEKhyl6QXDFnyTrt9BhQwrybR73XYFWMXc3N0+7RZaJ2A4nzvPqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stan,

Thanks for the reviews ans suggestions. Please my response inline:


On 7/20/2023 2:59 PM, Lisovskiy, Stanislav wrote:
> On Thu, Jul 13, 2023 at 04:03:32PM +0530, Ankit Nautiyal wrote:
>> In Bigjoiner check for DSC, bigjoiner interface bits for DP for
>> DISPLAY > 13 is 36 (Bspec: 49259).
>>
>> v2: Corrected Display ver to 13.
>>
>> v3: Follow convention for conditional statement. (Ville)
>>
>> v4: Fix check for display ver. (Ville)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 19768ac658ba..c1fd448d80e1 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -802,8 +802,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>>   	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
>>   
>>   	if (bigjoiner) {
>> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
>>   		u32 max_bpp_bigjoiner =
>> -			i915->display.cdclk.max_cdclk_freq * 48 /
>> +			i915->display.cdclk.max_cdclk_freq * 2 * bigjoiner_interface_bits /
> Probably "num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);" again,
> instead of "2"?

Currently intel_dsc_get_num_vdsc_instances will give total number of 
vdsc_engines including joined pipes.

So with bigjoiner the function will return 4.

This was good to calculate Pipe BW check: (Pixel clock < PPC * CDCLK 
frequency * Number of pipes joined

as we get PPC * number of pipes joined from 
intel_dsc_get_num_vdsc_instances)

Or to calculate DSC_PIC_WIDTH PPS parameter.

But here we perhaps need intel_dsc_get_vdsc_engines_per_pipe that will 
just return 2 if dsc_split 1 otherwise.

Thanks & Regards,

Ankit

>
> With that clarified,
>
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
>
>>   			intel_dp_mode_to_fec_clock(mode_clock);
>>   
>>   		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
>> -- 
>> 2.40.1
>>
