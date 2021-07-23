Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F323D40E1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 21:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BC6EE7A;
	Fri, 23 Jul 2021 19:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8946EE7A;
 Fri, 23 Jul 2021 19:35:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="199200988"
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="199200988"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 12:35:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,264,1620716400"; d="scan'208";a="663395219"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2021 12:35:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:35:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 23 Jul 2021 12:35:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 23 Jul 2021 12:35:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 23 Jul 2021 12:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5m3Dk46GUhenegOEn3VPZ5Zlk1hvG8nG2yFZ83rP8wJvlMVUXUNg654/NUcj/CR48S1KhvO5/RDNzpGvjAhPFljfWBan4KoDlwGuyOSQtHmF4PPMAlmCOlEQacVBRUzdFRInyKDA1pt1R5VcNh+t8niQZfXXB7T+d1eH9ZwTGR8agpL//mQ6EdSxWy5bpvQN2+ktl05k0mTDxuMDmFQgDtf7RlSy/t+/pGlyBlWz1u0RMI3u+54G75XLo0gVjOXhxmz2QAjNZHbIyVrh6346X9L7ntUPgtPk7kCTGVpQ/zHT5oYSJXdBb3Whqsa2U4BBOgZrL8FkMtN1GTT6ZTLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJmqsGjEoWldEk7796I5rGzPc6H2IYuPjT9gQawk8mo=;
 b=A4mnp47kTDIujCURPGYtXDjO8dJmfcUbEmF50CZZukJ2+db2ILVM93PpLmfB9UwoWYhm9Hh+R8TGt1XvO2pSJy/qwTGWMM6hMSqzkzxnbqO0Amc/szK4QaaKguDFlVv3GmGkJ978H/MLOLh8M/xQIAFd9YXDEFJFcliRX+7G/pORFbRJaRE/rI6PduYhfmaa08w0Z0lvDkUsQfjwU34JPERw/pzEIMMtj1G+wm/keSq7I0BUhAbeLGYmJSCnJ0T9PViyozwLexqWctIAp+vOzIf2KMBa5x7BrVnZxIIX/qP3TFCo0nRa7GdqXVYQ0wyi75jOLXV8s+bPyJEEXXlztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJmqsGjEoWldEk7796I5rGzPc6H2IYuPjT9gQawk8mo=;
 b=eFFJijfTlTDlNAX7D3huw6L92HEAlyC20R+mlf0uvoqn2oDQiQHMHKabwkz4Uzw9r/6jlPJ8GZwNbxAcPSbO3ofaGfB0pPqbBueC/lfY+f+4+RCuUMaWOFhWab7mLwDEAwWDS/Us1Qb+9YgGzO6VK6oxACVf4q5MU5ZAWwEEHhY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 19:35:05 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:35:05 +0000
Subject: Re: [PATCH 07/14] drm/i915/guc/slpc: Add methods to set min/max
 frequency
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-8-vinay.belgaumkar@intel.com>
 <e4a5657a-12f2-cb45-4021-47c9ebb36f2c@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <bdd4f6c1-90ad-cea2-442e-b59994e6856f@intel.com>
Date: Fri, 23 Jul 2021 12:35:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <e4a5657a-12f2-cb45-4021-47c9ebb36f2c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR04CA0052.namprd04.prod.outlook.com
 (2603:10b6:300:6c::14) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR04CA0052.namprd04.prod.outlook.com (2603:10b6:300:6c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Fri, 23 Jul 2021 19:35:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edf8e8d4-efba-4017-952f-08d94e10f933
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5650AABA8146A803E8EB727885E59@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4m06SrlP5F/e6pAagYA19R3DBHVKyS38MTPFDjmOL8WrfMxuxqyu5io6Id7MdN2Kn72PW9u1WPBNr8GpCePgEir1mw+XSV+36gJwY6YafX5EBVI7oRtSrh/Kw7rXdDKVXBogMSiq30w+6sB5FJVfBGLqL3qvI876YKTFFN/imW85wXSMh2y12xwRsqeUueLuHdf6uwqKFKeDOk1Vai8Mrmz+D1zBEER7374qLjP+pymfwPlijPXGzoYuKRZSzksKTQ9d8C/lEEwILti1h+uLX86syHQ944WAGuSx95m+X6Sv9LMAn38zhlB2cXYZaJTrshzfJgHL9b8Lpp4CbC1QaHz1+BAed9XeW0Zrz1dVj+QCvozZsFrpjLcVhA/9tlZq0DZRdSW1T0rBI3XCZhnjOrQ+XNBWq/Zr8keZgNqlzDfRBjHnCF6aJy8Yu3VetZI0vS0FT8EYtNM2ttt/jhKO1nZGvdyUxbcbgb+75YmDmvH9J7zs5JTjr15omfrF14dytOUjOoCqDmTNNQwTv+Y+wzsjXwJGc4cnZJUsyb3JDtP0/NtGZDWzmDggMW71li5qJrhd2qsMWsNXGT0OxUQMPNljDJRlpfrw9GYm0toC8nB78n0jDriStncIiG92YfSmhfZOB7gzKccxwh+oaxb1IBZYhxL3YyX1RYbvFZNh4OmXfAlrXJinCQAePqXtNsByiXkaAf++4b5QXWmgsadT8N1GkhCbs+dToAoW1kMtpfQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(450100002)(38100700002)(4326008)(6486002)(66946007)(16576012)(66556008)(66476007)(31686004)(316002)(31696002)(36756003)(53546011)(2906002)(86362001)(478600001)(5660300002)(186003)(107886003)(83380400001)(956004)(26005)(8676002)(2616005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNJbXBDK0drRFh1TWw2cTJWeTBKQTlVUk1UQVBsR3czTEtYYVFmOXRNcXQw?=
 =?utf-8?B?eTN2TFZWOWd3aXNoU3MwTG1qUGloMWp1Q20xUEhiUkNqeElDUnBVQ0hFcEZO?=
 =?utf-8?B?Tm9UZHNFdEN3a2o0TVNqUklLQzRXcHJndlBKNUtiNHVUODA4SVJIUk4wQUYw?=
 =?utf-8?B?OHI5aGtudHZvL2VyS3BOM3N1SEFsMVNpWXlJMEhkK1k1cnIzODNDSkFoR0g4?=
 =?utf-8?B?cEticnpiOUxxRENIbTVSalJQWklYZm1zeWZndXgrK3AyVGNOd2kwckF2VDdo?=
 =?utf-8?B?Wmt3a3JqKzBQVXlzbTFGZi80OGNRMmNUeXZSa04xZlN2ZTQzRnMzMVVCQVpS?=
 =?utf-8?B?a1ViMVBiS05lQmlEWlJoOHY1NVNlYk0rRHVPMVpJODVqVFhoQ0pIN3lmVnFn?=
 =?utf-8?B?TjI3WFlUbnVyOHI0THJVU1hNSmc0TlBFUDk1THFhUzk1cW1lVEtQQmNMUEhn?=
 =?utf-8?B?WDB6WUVDYXZXYUo5ZmlhancwbkJpb0RyNDdGSjJJYWxIR2l2NWVMaEhhcU1Z?=
 =?utf-8?B?Y1p2WTRIRXNxMWtSMWVZaENnYnZqdDZPOFMxZHRTNW51a05zSTFDbnpUOGIr?=
 =?utf-8?B?QjBZUFQwdkNFYnpuN1dwNE5Xd2tPSkZBSmpFekhkdGQ5SVM2Rk9uWUxMOExw?=
 =?utf-8?B?aldpWmg1UXgwR0U2bEJDL3A5OFg3NFo2dGxKVHdPbTV5OWwzU2R4R3VnWk12?=
 =?utf-8?B?ZFM4L0tBZExvbDZ6OFYza2RTamJ2eTFwd1pJY3ZCYjg5c01CN0tUam9KUEZK?=
 =?utf-8?B?Tkg1Wks0OVhRTWZxWDlHUGRGZGJXdU0xaE9IY3hGMEdObVI3NWI1QmRSbWVh?=
 =?utf-8?B?MDdOeDNjUGtCSVBiQVBnUS90dDM2ckN6WFRRSW5CSGdyZWl6eE1aYncwOUxD?=
 =?utf-8?B?WG5pOGR3aTJUajRGdEE4SVUvVEt2QWhCYkJBUHBGa0Q0WmNJUHFOOFVJdUhs?=
 =?utf-8?B?amNxZ3FHdjVpcHkvNm5ubEJwWmo2NHg0OCtGcXVHdzVkSEtLeWp1T0IrcmJo?=
 =?utf-8?B?RkNtclk4bXlkQ05hT3NJbERUTjFZWGczd0pMLzJRd2FWVDU5ckdNZHFVQUpt?=
 =?utf-8?B?UUJEcUw3VjcycjYyWFNmSlJqY1hpNzBQV2IwMU1PdEp3cnE4SmJaVDgweUpP?=
 =?utf-8?B?cStUTE5oWmJmRExFVGtaTTNIdUNJWFMyWlgxd2hxZGNEb3BnaHFjSkVIZmU3?=
 =?utf-8?B?cTNlREd0ODhJRXRmNldNMzBKZmc0aUxiMEtwMnBzVjVnODNwTWJ2aDkwKysy?=
 =?utf-8?B?NERqNkdDckpEd1ZqOGJSYmVRMDNBeTdtY1VzMHNWS1kvME1hT0JGaHJUV3Jt?=
 =?utf-8?B?a3Vib2lPSnhodkhSVy9HQzRvVVpGbVRBbGd4eVp3YncxOC9TS3JUdjRYWnlN?=
 =?utf-8?B?eEd6ZFgwcENQVEQ1Z1d0TVJ0YTVlaFJqZThqUy9iTHZqbkVtNEJFakFIS1dO?=
 =?utf-8?B?aW5TV2Y3bFp1VXRDZGVWeVlrRmhxa3BSdFFiVWd4NkhKNXZEVWlMc3VzUUl4?=
 =?utf-8?B?NlptTVdHa2o2TksyTU9ERXY0MEJrL1RuS0owYW9hbFhGWE9za0tBdU9qbm1P?=
 =?utf-8?B?dXNhaEw2S29VZkFKR3NOSUFDdUk3T1AzNThRU1dOUXF0dGNOR1J5S2F0eWFW?=
 =?utf-8?B?OU1LUmgrbnFrTjhnQUFyWDhKNDF2aEphbjVDYnBoWk1qeHpGajQ3WUduZzJN?=
 =?utf-8?B?S3FRZ2FHdWg3R2dKTUpudDk3ZkFLMHFFN2o5UEprSlBCd2d5eHlIbFdGWEpN?=
 =?utf-8?Q?xLsk2YdVM0S6L5KCiZu4StvKPpF0pVf4Ob2Q/3V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edf8e8d4-efba-4017-952f-08d94e10f933
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:35:05.7663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS8WcVWDKmOafyhAyOw3dtA24Z6tT+djYK0nSTgoL0aK4lagGqySsXZ7wnh3TOzWHMJk1PGs2wL/QMn9dc4MOsWqeNYaAQFAhRuulkZNTyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/21/2021 10:42 AM, Michal Wajdeczko wrote:
> 
> 
> On 21.07.2021 18:11, Vinay Belgaumkar wrote:
>> Add param set h2g helpers to set the min and max frequencies
>> for use by SLPC.
>>
>> v2: Address review comments (Michal W)
>>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 84 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 48db2a8f67d1..b40c39ba4049 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -109,6 +109,18 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>   	return data->header.global_state;
>>   }
>>   
>> +static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> + 		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +
>> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> 
> beware of possible non-zero data0 returned by guc_send()

Ok, added -EPROTO check.
> 
>> +}
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> @@ -143,6 +155,15 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>>   	return ret;
>>   }
>>   
>> +static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_set_param(guc, id, value);
>> +}
>> +
>>   static const char *slpc_state_string(struct intel_guc_slpc *slpc)
>>   {
>>   	const char *str = NULL;
>> @@ -238,6 +259,69 @@ u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>>   		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to update the max frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	int ret;
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
> 
> nit: move "ret" as last

ok.

> 
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +			       val);
>> +		if (ret) {
>> +			drm_err(&i915->drm,
>> +				"Set max frequency unslice returned (%pe)\n", ERR_PTR(ret));
>> +			/* Return standardized err code for sysfs */
>> +			ret = -EIO;
> 
> maybe caller (hook in sysfs) can sanitize this error ?

Caller will then need to check the error type - something like-

if (err) {
     if (err != -EINVAL)
         return -EIO;
}

Seems cleaner to return specific error type from here instead.
Anything other than -EINVAL or -EIO causes garbage in sysfs output.

Thanks,
Vinay.

> 
> Michal
> 
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to update the min unslice
>> + * frequency.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>> +{
>> +	int ret;
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>> +	intel_wakeref_t wakeref;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +			       val);
>> +		if (ret) {
>> +			drm_err(&i915->drm,
>> +				"Set min frequency for unslice returned (%pe)\n", ERR_PTR(ret));
>> +			/* Return standardized err code for sysfs */
>> +			ret = -EIO;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index f02249ff5f1b..3a1a7eaafc12 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -30,5 +30,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   
>>   #endif
>>
