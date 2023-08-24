Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B1786E2C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 13:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF5210E530;
	Thu, 24 Aug 2023 11:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4D010E52C;
 Thu, 24 Aug 2023 11:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692877336; x=1724413336;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3ABNmQ4Vm38+X7atKWEfvVNPDWbefN/dBBEmv8DRbXs=;
 b=kHHP6MQtShIO4qmG/Ql8QOMELyVLzK5oPMT1NVqiKo9ovzdpzEempey4
 WiKPWF0UgYROeSW1Uufv16dp50aFSO+c3nZoLF2hEwCiVxcwhElnnB15R
 OeoXkY2S4ajXNdbSiKQQoVOiz6fYqH7Z1l3cbG6Jh6SYNleXOO+WBq2ZX
 avzMyeftiyK3tgIkBzNHjiEc45Jv6pL9RzT+cbfGoPDnzDQM5aNZYrU77
 w8a+F5U9MFLaAOpIWjamJMYJiLHPewMd8DHWWdtCG3ALvGdz/er+5NQyp
 ohZL9maVTzhgwOzVgqhQqCyLBfYCLbUEwaPRot4b20jindf3apfaKTnqN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405421815"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="405421815"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 04:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="740148164"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="740148164"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 Aug 2023 04:42:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:42:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 04:42:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 04:42:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 04:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j11V2tVDjYu3WrPU2jyzUMtFbTc6UGNf8QhWqY8SDoH7v68nO6iRCFd/Epq9yETiMUzgOdt9BJSY1RHUgt6rhYfDtwQVyUuC89tKAykHp7o141OR6HayiUALB1F9lUL5ioYA/pCDkQpB86VldztLcls3ZCAbK1nD6JFq/DGuxDRVcKkS0PCRzZPMVLbOJ++ZusjFuvMbRxJG5vh3hHHZ22Reau7v3J102wLVXHZAhllM1/QvzbMVMsuNNpOalzjhQw9aVS99AnHaZ9j9M9MhPDOPIAQ4deoW2hWpQzx6NB61hHC70MIPfEXTOSbj+xFO9PagKsQVZhACbMa1z25bwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sydNpKCUBwMzFzZQ3MW3xpUiXTmDQvFsrCzCR9wEAf0=;
 b=d+5rZYO3eZ5SaKMWjNIGT/6gH45SFy/ne083t+SEKOv7H4mkpVDTa5FmhkgUg8x95SXiDguQtNjN/nnhswHklZIrXNmYXuRX8t/uMrBxtFY4UKm/cIb4JNQ2pT/5LvJhbMr/3IegW5h3ZX4fPDM7278fNFbqQZxRpeTuvSX3XwgwSb616GaqaNctBLiTJ9njq3ksRNIbMiOrOkdy2uGarg0raQld3Nr4jcqVMajD7GaKKTZ8hl0ClC/Rng/MBHEIRe8Z7Dx4QfPWBHMSs8NXOOJ1eJ6FnxMzAmVGLzJLTwAxG08xcPW88/8ATAiDYKGkU6zntguCDCAYUk7NSEWa4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 11:42:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::1e8d:5942:e23b:c08d%6]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 11:42:06 +0000
Message-ID: <a297d229-70b2-e29a-c65f-b68072e3fc89@intel.com>
Date: Thu, 24 Aug 2023 17:11:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
 <20230824034705.755243-1-ankit.k.nautiyal@intel.com>
 <87lee04vuf.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87lee04vuf.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d36d3a0-c38f-4c12-fbc3-08dba497249b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sf2G9uD117Su8dirKN2wRbRRIhVSwxRoVYT/+8LfR/EeUZG5H+XVHYGMU/MQXIZYwz7iPZD6H/kLug+S1wRIJQW8nXCdwvkFR+q8D7yp44+g3Dj17I2oV88dHnhmKtc4GTGODZTHzVB9rXht5TReYrofQpflePiyK+NVw3oaf3hOj5GKR99cjsbFUKn6ZA/Pz6jno35LQojXKLLbtGwutQbfLKFWppbrCsKWOMe2yEO7bdn0dpl3R4/wDkWVlnP5VO2KOPbn5DkQMMeFirHNQ020tbDek+dUgSxfkyVKuhpzkf0xIX7iel8GJedl3hddTIjJGk4RpUtflDO+XhT3wbH+/7+7WWiBzx7jPWVg5+PhG1W3bELvqKUyZNCyxj0Lz3/GjekcELgzqngEUfeCuleVZquFXsvhcZxNj6peJMl0qmo90xzQlTAd5EXopaa0KhgmOhyNiKvuETzDkr2CxQ/9IyWs5xxCBxxdT9al5ieG6p6SnVPQMbVxjO/jCUq39OLW2dfM9xlekdqICndzd56ALKCbD8KmQomI9Kqe8sJZAn0VEK5B50vgilsZB25Tc/72oOS77Y683Q4a97iKblexYQEmvsDzIRtVBxW5CSdm8rtgnEBfqNfnje5klfJMfvxbde7zT+TICxGuJKtXlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(66946007)(66476007)(66556008)(316002)(82960400001)(478600001)(26005)(6666004)(38100700002)(41300700001)(53546011)(55236004)(86362001)(6486002)(31696002)(6512007)(2906002)(6506007)(31686004)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1Y5a3RWT01uUmZlNVJtQUV6dDhLTC9Od0xUSzdmWlRoKzFOR3NnR2R0aUIx?=
 =?utf-8?B?Z3JXMklRRXo2N2tZeTdpd1lNaThyQXpZYkJiVlV4ZkUzTzl1RVRKL0JhVFdy?=
 =?utf-8?B?Rjc2aFgxYVF2eWVCT1BkWnVUODhMVXNFeGcyV2Yzd2t1SVpsMkdEc0hCUk9h?=
 =?utf-8?B?TU4yWnBFL3J6dW0yKzZqeGNPMEo0MEttWndtOGU3VzFCSTJCNm1kRitOMUR2?=
 =?utf-8?B?T1JtT216enlRa3BrT1JtZkFwMGltOFJGNGkwb25ZL1NxYWI5TjZRaHJqMktQ?=
 =?utf-8?B?b3QvTnJScTJvQ1d0SXBzcHVkKzRkbVZMMlVCY05TU1lQOVB0WnNHWTVvZmQ0?=
 =?utf-8?B?OVRwVzJobU9iRTQ3YWZuTVM0QjZoRlEzazd2RUl6NVlnM01PK1ByUEtLbTVB?=
 =?utf-8?B?Uk10bzg0UnBYem51YXcwUXpoVlJmQWVubGs1cW4wcTZJempkRUZ6NXlVUVYr?=
 =?utf-8?B?LzhXRjYwQnFFbk5ha1doRy9LdjVaQmZIZzlKUmVpMU5LN2s4NFhJTXdKNXFP?=
 =?utf-8?B?UjVOZ00xZDB1a1RCZjVqc0xUa2NJQkFFU1VBb2JsREpFMjR5d3lKWVNQVGZs?=
 =?utf-8?B?K0pvMWxCTFZyU25kZHdzbU9FSjV4QXhKa2R1Vi91ZWZ4cFdpeXE5akg2Qlky?=
 =?utf-8?B?VUo5NTRmMGZLM2pxNXdGSDZkYWxPUXY1VzZtZTdpdjJrTTJCNHpYQWZoWnhh?=
 =?utf-8?B?aktBbmdjZEZBUTRCNEg3a2t1Ujk3cUUwRW1zR3RPMmplTGQrU0tBMjFuRmJY?=
 =?utf-8?B?M2MwRzZ0a3I1dkNCcTIvSkY2OTNoNFVaQ24xTnNjSHFHN3JWYlFzWGxhaDF3?=
 =?utf-8?B?VWM0RnlER3dqY3J3by9sVkVldDd0Ni9TN3laSE9kTm5SZDVkNEFPQlhaSVUw?=
 =?utf-8?B?L3Y5bjRYcFViRzhtdkx2cjFySUpld3VRcUNEM08zbmNmdHAwd013ZmlJMVJE?=
 =?utf-8?B?MFZTa1orZktOa2lUaG9vaDBlN01ZMXNlcU5odGtuc3ZwWEtwT1JyUDFtNlFt?=
 =?utf-8?B?TFdCUWVLd1BLeTUxcGtyV3NmYmM5U3hFakdZVnNsc0hmRGN0amw4aUtIdGpC?=
 =?utf-8?B?cjBWSVZWa04wYVM2dFg2NVFQdVdORjVkK3ZqUnRJTkY3YUk3R1NZdTVOMmJM?=
 =?utf-8?B?d0ZDT1VNNWVjV2NtamZvK3lra1dMRlQxcXFCT0lRdEtsaHc1OC83L2xEV01I?=
 =?utf-8?B?dDgxWFFVVXREK3pGNTdjemlZK2kxYTVvdk9obmNybnR5WU5neHBuMmswM0hx?=
 =?utf-8?B?cnRJT3BhTzdBVjBabE42NFQ5SWx5cEZudHJqMUZhOGVnUE1JVWZVeUlWOGxX?=
 =?utf-8?B?RW1MN1lXUHNreDlmeGd4ZkdDVzB4TTBMYnV4dUFjQ0pwcnZjWlRMK25JaXJG?=
 =?utf-8?B?ZnpRWVhLMVZITjdXUWR6bi9NeXNGNTdka0taS0E2RWRuQzRVQlhrQkw1UWM2?=
 =?utf-8?B?S2lnY1FZQWVnK04wYUx1cjRBUjdqQklia0MxSjd2dzVlcllEc011cWFBbVlz?=
 =?utf-8?B?WjRrTysrTlNKSmRDYlpRM1JIeWIzLys0ckwrdk93YXMzT2UwaENtR1Y3aHhj?=
 =?utf-8?B?UFJEdThmZ29OZWZOQkZXaWdoU2t6bC9KNEpDRWFLaGNCNGszaUFhdDN2cllH?=
 =?utf-8?B?OTk0Zng1WUNkcysvZk9VMEJVKzlsaWdEeHQ4bWxjUUU2MHZRR2RUbk1uWWlS?=
 =?utf-8?B?RzI1LzR6VStob1JGWkxjdjhlcEpyK0VCelg5MDRQbU85anRCYytUYWt4WVI0?=
 =?utf-8?B?NVVSYTRlczBYcXJvN0FXN2QvZDg3aTFRUWllTWxCOUhFcFlvVlZBdk9NZms2?=
 =?utf-8?B?R1ZVSmpacnpXRFNLN3NvSE9rRHQ5VTFCZGNrei9MSmxNN2RIVDU0SzZQcmUz?=
 =?utf-8?B?SkUwY05GNUNUblA3N2k1dml6ajlnaGpuZ2I1ajBtVEdUTVNVdVJhTmV4Wlpa?=
 =?utf-8?B?NVRLWDNZYnlucGFrc0ZtZHlHMS9KWE5nZ0MvQUcyZW5jMnZ3KzRFamorN0R4?=
 =?utf-8?B?UXFyU3RJRGFKQVNFeXN5azRadlR2bmpFbjdOMmxRcEdWdk44WE5SWURZQlF5?=
 =?utf-8?B?Q1hQODdXOVlCUGk0ZDM2OGNUNzhXZElYTDhYT1ZpTkRqME5aS1RSYkE3Nnk4?=
 =?utf-8?B?aTM4alRIMmlHRmF1VHhZY2orL0RjYmNqWkZPYWNBY0Jlbkw3WDFnY3hGcXNC?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d36d3a0-c38f-4c12-fbc3-08dba497249b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 11:42:06.8062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqcCbTBeBrfh8d/ezPGvbHGv3DFH+N19qxivjMGbJPYHpUQZZMhdxpsExKwouPA3QVjMCbi/rYNw/XblZ5bSuPD4TRL2zgzIbqQ6Ih/hGa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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

Thanks Jani for the corrections and suggestions.

I agree to them and will fix them in next version.

Now that I see the commit subject line also should have been "Assume 8 
bpc support when DSC is supported", will change that too.

Regards,

Ankit

On 8/24/2023 3:15 PM, Jani Nikula wrote:
> On Thu, 24 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
>> Apparently some panels that do support DSC, are not setting the bit for
>> 8bpc.
>>
>> So always assume 8bpc support by DSC decoder, when DSC is claimed to be
>> supported.
>>
>> v2: Use helper to check dsc support. (Ankit)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_helper.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index e6a78fd32380..309fc10cde78 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -2447,14 +2447,19 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>>   					 u8 dsc_bpc[3])
>>   {
>>   	int num_bpc = 0;
>> +
>> +     if(!drm_dp_sink_supports_dsc(dsc_dpcd))
>            ^
>
> Missing space.
>
>> +		return 0;
>> +
>>   	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
> All declarations should be before code.
>
>>   
>>   	if (color_depth & DP_DSC_12_BPC)
>>   		dsc_bpc[num_bpc++] = 12;
>>   	if (color_depth & DP_DSC_10_BPC)
>>   		dsc_bpc[num_bpc++] = 10;
>> -	if (color_depth & DP_DSC_8_BPC)
>> -		dsc_bpc[num_bpc++] = 8;
>> +
>> +	/* A DP DSC Sink devices shall support 8 bpc. */
> Mixed singular and plural, a ... devices.
>
>> +	dsc_bpc[num_bpc++] = 8;
>>   
>>   	return num_bpc;
>>   }
