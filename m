Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5703DAA06
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891FD6EE15;
	Thu, 29 Jul 2021 17:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDC6E104;
 Thu, 29 Jul 2021 17:24:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="274014007"
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="274014007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 10:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="507366935"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2021 10:24:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 10:24:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 10:24:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 10:24:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBPeoG/Nz8ejFqdTrJPhDb7wNf/DMAIFUYRxS+VuwUVvfq1Vz6TgX9mN2Nb96hz7qlghRQ8lkZN4YYGCNYtaQIbBiCeu9GeIWSEqVsw9UdIUj+heqxKu1YUHtxEGykkc/1R+JaK3ZIi33PFPEZn9cm1+lA8WOjh2iLn4CP5f0ywNwgN+aGzJ7qExAFuPWHKDnG++m1Bc2tRg3vI9vBbUzV7Qj0yZZIVz8T+6RTcq56c5GPSfU357ggllW1LLR/MonP22DN9Lo8rCiPZLmg6BMTJdnh8w8hVVSAwSHTme/bX7eWfG7fY/2IPOm+WVikBUbF4a8Xn82y9r1A6VV4qj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nB1xNnuJ4ooae/Stb6b37Fn0Xcib1rhrXHDeGKYlLA=;
 b=ZAxhg1SO9Fh1d0RH3GWgIyAAoc2ZFgWXQvUXZmm6SvAi/uRKqmCs9G5+pk72pV4F79Jdn7tkFkRtZcbNsWgsDhAid6RrcaOiKbbIpwADYqx9x/wYbUzsFGpXSHeWfrQr8S3wY1DDNs+uDYBNmaIKnaHqMrdrtQU3VpvG0WBCv931CryyebjsMtt0Gc27vDIaq26U9Mcsd80mr8shckMD/PjddnmX8UNJprb8mMvNa5U3f7SoQylYFN63JL9mPnjBHOmi3x+tH0JauytS8+LQe+8OG/Z94wEe0jC9etiyoiZpg7dWDkrT2kSYYmJJfocDjQY6H1PNbvdEoKKpQ2gCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nB1xNnuJ4ooae/Stb6b37Fn0Xcib1rhrXHDeGKYlLA=;
 b=LZEOCxRHZ2q20U896T0fDI71xKUmdK6PjKenqOvBJk6CNwKoKuGy1ob/Ir+oSqoOjSOMJw5tA5ViSD7TjjW87h5vzi+B6zGiIgBJ5569a1WQElaZlspD5Ede5BnOLQ8jux2Wjc1RAyOQl87l9xIe9PokRVT58Qlz+OGMnwUqtk8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 29 Jul
 2021 17:24:05 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4373.022; Thu, 29 Jul 2021
 17:24:05 +0000
Subject: Re: [Intel-gfx] [PATCH 11/14] drm/i915/guc/slpc: Cache platform
 frequency limits
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
 <20210728211144.15322-12-vinay.belgaumkar@intel.com>
 <cd7cc618-05b9-8f1f-7a0a-7417f09f9b12@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <55241f16-e17c-4d43-9af4-9db2c1be2335@intel.com>
Date: Thu, 29 Jul 2021 10:24:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <cd7cc618-05b9-8f1f-7a0a-7417f09f9b12@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0047.namprd08.prod.outlook.com
 (2603:10b6:a03:117::24) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 BYAPR08CA0047.namprd08.prod.outlook.com (2603:10b6:a03:117::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Thu, 29 Jul 2021 17:24:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e36f235-0e66-4e23-01b2-08d952b5aa93
X-MS-TrafficTypeDiagnostic: CO6PR11MB5633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56337E7E74EFBA0B8807DA0285EB9@CO6PR11MB5633.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0wQUZKUXl1X2LMqSmDL7iSwPoDP1yqSFQBP5tZ2ZnBEIWGOEYIkeynUHgXlPwgWHzA3R4yh/s2ZMpg+UZACentgGk1geGuHKQUfEIblu6oFDKN7coqVtX8XAWOkw+HV8IcnImeqLOXgFd/VeoHZCjhCkAlHeWAf7l7WVjgheX6yDoxGIDAWHJ2hccgvIn8kJmm/JxlTB3muRFw8hLFUHbZUUDu+5hXl60nmkxsWJT/eXl84oqa4AAi9HL2/+ckuC6MSSlcueLHtcIE/6JY9xb9VJCRBwcEH1u7nkOWohn+2zC4DSwte5ve+aE5dctOs3BipRr2S0Diue+PtHECc/0kF3GfJysAlRGUOINLP5Qpzzv24L4wsDA5KIpwiDDFkkQpLUnBLsm6RLmYPWlbgS0U6QeO2qUOrZgWi8tP6e5C63OGd++naCQQdWuzEkwxBBCyPZRSea91REBawBG41GpR+1AtZWw0tpw9DlMcKhF5u5W2vWOST/GojBZkFEHCWTP4rJofiF/mS0sz+3StMNnN5lnhUkdT1rI46U4qA+7NjHOZKTUUHZ2K3R/N40Fr2zrWQ9yRU+UGX+tT/C7+tVNoXRlHrghdFa9ClmJjI1f65N9HulzVynABVKN5997bTZ/spnWiXdlsoO3RR0z6xJvZrxsY/NVeAAfpRzJkheK0rQkXBLdU88aWYA5Dxt+RaypGUHdBfnXvT7Q+39zlF0uhxESwUc/2ivcTuQ5STUn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(450100002)(86362001)(66556008)(26005)(31696002)(66476007)(8676002)(8936002)(53546011)(83380400001)(66946007)(186003)(508600001)(2616005)(36756003)(38100700002)(316002)(956004)(16576012)(2906002)(6486002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGVPM1o4M0w0ZU9pa2pRSWsvb3pPQTVUbjZiVHkrRUxlTm1JZlNVeDZ5T0pW?=
 =?utf-8?B?eDIrYzdoNEVtck5VOVgxY0FnRmJaeWZrY1BqMkhqeGVqa2pvVVpTQkRCK21k?=
 =?utf-8?B?clVKSWwvQTZQc1BpdmltcklRNFloYVlvNnRTMHJCZHd0eENHQ3NUSFFjeE1k?=
 =?utf-8?B?SVV5dWJORThVM0hwMnZQT2F4bU5ZODVuaEZ3anBld2JtNzZybzZYeS9WYTNZ?=
 =?utf-8?B?cUlvZkpESmFsR3BZVU1BSGZlWndTRVJmK2NTaHJGTkZEWVdSanMzOGt3Qjdj?=
 =?utf-8?B?c1dRc3RqQ0FZREhTYUpMSUtKR2tKTjVvM01ja1hXamVJaWhDT3QxMVBpOGhn?=
 =?utf-8?B?dUwvZ3M5U2lIYWRwU01Xem1YQjg4MCt0Nm5pMG5WUndJL292VHFDWGVsb0Vu?=
 =?utf-8?B?M0NnTndZT090ZFlrM3VsV0wrbmFGZk1sdDJqR21FVzVlNzhFWml2ZDRXUGNK?=
 =?utf-8?B?VWNXSkhTYkM3YjByclpyMWN2WThsaE42OTlpYm1SOEZmdHBBU0wvOVZyTjRF?=
 =?utf-8?B?Z0tIYS8vUUJWbi9XY2Q0OHFHNVlGVkhKUi9ZOWovc20wRkhNM1JHWXh2TnNV?=
 =?utf-8?B?QWpkY3plLzBNUE9UOUIwazlDS3hMVWNzeVZXU1pCTzJHR0RmTkY2TVI1TUll?=
 =?utf-8?B?ZXZrY2ltUmF1eTZVWTlUamJuWW53ZWFhR1pNL2lHQW9BbUNmVVkzejFLVEhI?=
 =?utf-8?B?ZitseWRLcnRHbFpYVGYwOHg0WTg3NjNuZXFBWWRZNzJFQ3FCeWNtSGdZMjZx?=
 =?utf-8?B?OG5zZTM5U3JpcmJMMzhVZDNUeW9FSEhrTEZ1R3dXOHJjM05ncFdPWUtSemNO?=
 =?utf-8?B?VkhFOFJicXVGdkhSckpJTE5HOHRKMzc0Mk5KMldONG1VREVSVGx2NW4vOUU5?=
 =?utf-8?B?a0dhRWhiLytyMjdSN1hiNmMxay9ybzRFM1NrVlkzQTg2YW1pMTY1ZzhDSHRm?=
 =?utf-8?B?S1JWYzRhelNubWFabTZVYVhzNVFmVVlYbUpqMHV1aE83RGpXT205Y3pQT0pt?=
 =?utf-8?B?WnJwcGNqbFVFTEVZbXdIdngwOSsvNkF3eVpYOVd4OStTMjFIcjYyb3lZcFhW?=
 =?utf-8?B?VTRibENmaTh3UzF3am9hZmpsRVNzb0hVSmhLV05WSkxmelNGdnAxRXI1eEl0?=
 =?utf-8?B?RGJ4U1JpNzFia3JjL21sY2cwenpYekRTSHBHOXB2SlJ3R0h0K1EyVDNydFE3?=
 =?utf-8?B?MmJxM1ZxRXV3eFQyNkMzUWNWWElTRmpabjFkdi83MUExbTVJL2szNHd1MlFB?=
 =?utf-8?B?RVZjWGFSMnhJMnpGaTE2SklFKy9xVWpmRmVNR2V3RDAzcWdhQXJPWFBMd1lT?=
 =?utf-8?B?QlhOQVV0UzU0VnRQYkxZK2VYVzBOdVdMOEZxS05aRUQ0eGczTVFueW0zQVd5?=
 =?utf-8?B?cE5hd2FtalVjSzNUY0ViZkJNc293QWk0SHl0R3BtMlRWYmlZdVp3ZXNXSnM2?=
 =?utf-8?B?eS9kWFJMQnEvZFdFV1NqRnNFSm0zN3U0RXBvM2g3TXQzeHNLTEYwZzJEMS84?=
 =?utf-8?B?Ry8wSkg3NFg2cU1yMk1RVEZjaU1hNWk3L2Z1YXYzMTg4K3cwT2NHVWQ3dU5y?=
 =?utf-8?B?cUFhUEFjT0Vwbml1V0ZJTTJUVUZHY0hPRUEvZEZXRVhiaVNYNkljV3Bib2FE?=
 =?utf-8?B?ZVRVd2tpSzBRZEExOVQvd2xpc21Pa0RxQ00ySFZuYTNWSGNIUzhHWEtRcFg3?=
 =?utf-8?B?NXpYaXBPcjdYdDcxeVBhZVlCK29uZHd6elZySUE5Q1Z2eXRzVHp2bkhtVFh1?=
 =?utf-8?Q?KPoqFh+g2UgeLL+/0lV0X9ISMxtZDVY7Mfr/PAs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e36f235-0e66-4e23-01b2-08d952b5aa93
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 17:24:05.4751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJtC8VUIPtRBtpGTldi48JDY1d73Qkkkj0RZVOZsbm8ezV+Hlxju5UkW8YZD5oxC5oSkStaJLYqQwu0AzDxQQ24IWvnQ74/gCje+IeJ61gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5633
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



On 7/29/2021 9:21 AM, Michal Wajdeczko wrote:
> 
> 
> On 28.07.2021 23:11, Vinay Belgaumkar wrote:
>> Cache rp0, rp1 and rpn platform limits into SLPC structure
>> for range checking while setting min/max frequencies.
>>
>> Also add "soft" limits which keep track of frequency changes
>> made from userland. These are initially set to platform min
>> and max.
>>
>> v2: Address review comments (Michal W)
>> v3: Formatting (Michal W)
>> v4: Add separate function to parse rp values (Michal W)
>> v5: Perform range checking for set min/max (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 115 ++++++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   9 ++
>>   drivers/gpu/drm/i915/i915_reg.h               |   3 +
>>   3 files changed, 127 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 742918875593..bfd5fb0751fd 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -94,6 +94,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>>   		return err;
>>   	}
>>   
>> +	slpc->max_freq_softlimit = 0;
>> +	slpc->min_freq_softlimit = 0;
> 
> shouldn't this be in intel_guc_slpc_init() ?

No, we want to maintain softlimits across suspend resume.

> 
>> +
>>   	return err;
>>   }
>>   
>> @@ -124,6 +127,18 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>>   	return ret > 0 ? -EPROTO : ret;
>>   }
>>   
>> +static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
>> +{
>> +	u32 request[] = {
>> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>> +		id,
>> +	};
>> +
>> +	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +}
>> +
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
>> @@ -177,6 +192,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>>   	return ret;
>>   }
>>   
>> +static int slpc_unset_param(struct intel_guc_slpc *slpc,
>> +				u8 id)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +	return guc_action_slpc_unset_param(guc, id);
>> +}
>> +
>>   static const char *slpc_global_state_to_string(enum slpc_global_state state)
>>   {
>>   	switch (state) {
>> @@ -307,6 +332,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	intel_wakeref_t wakeref;
>>   	int ret;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val < slpc->min_freq_softlimit))
>> +		return -EINVAL;
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> @@ -317,6 +347,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   			ret = -EIO;
>>   	}
>>   
>> +	slpc->max_freq_softlimit = val;
>> +
>>   	return ret;
>>   }
>>   
>> @@ -363,6 +395,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	intel_wakeref_t wakeref;
>>   	int ret;
>>   
>> +	if ((val < slpc->min_freq) ||
>> +	    (val > slpc->rp0_freq) ||
>> +	    (val > slpc->max_freq_softlimit))
>> +		return -EINVAL;
>> +
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   		ret = slpc_set_param(slpc,
>>   			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> @@ -373,6 +410,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   			ret = -EIO;
>>   	}
>>   
>> +	slpc->min_freq_softlimit = val;
>> +
>>   	return ret;
>>   }
>>   
>> @@ -418,6 +457,71 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>>   			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>>   }
>>   
>> +static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>> +{
>> +	int ret = 0;
>> +
>> +	/*
>> +	 * Softlimits are initially equivalent to platform limits
>> +	 * unless they have deviated from defaults, in which case,
>> +	 * we retain the values and set min/max accordingly.
>> +	 */
>> +	if (!slpc->max_freq_softlimit)
>> +		slpc->max_freq_softlimit = slpc->rp0_freq;
>> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
>> +		ret = intel_guc_slpc_set_max_freq(slpc,
>> +					slpc->max_freq_softlimit);
> 
> if this fails, shouldn't we reset max_freq_softlimit to platform limit ?
> otherwise we could be with some potentially bad value forever

Well, if this call fails, it's likely the next set_max_freq call will 
also fail, so not much point. Also, it will likely (?) just retain the 
old value, which is fine.

> 
>> +
>> +	if (!slpc->min_freq_softlimit)
>> +		slpc->min_freq_softlimit = slpc->min_freq;
>> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
>> +		ret = intel_guc_slpc_set_min_freq(slpc,
>> +					slpc->min_freq_softlimit);
> 
> similar here
> 
>> +
>> +	return ret;
>> +}
>> +
>> +static void intel_guc_slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> 
> static functions don't need "intel_guc" prefix
> 
> slpc_ignore_eff_freq
> 
>> +{
>> +	/* A failure here does not affect the algorithm in a fatal way */
>> +	if (ignore) {
>> +		slpc_set_param(slpc,
>> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +		   ignore);
>> +		slpc_set_param(slpc,
>> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +		   slpc->min_freq);
>> +	} else {
>> +		slpc_unset_param(slpc,
>> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
>> +		slpc_unset_param(slpc,
>> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> 
> indents are likely wrong

already fixing this and the ones below as part of the checkpatch 
warnings I received on this patch set.

Thanks,
Vinay.

> 
>> +	}
>> +}
>> +
>> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
> 
> slpc_use_fused_rp0
> 
>> +{
>> +	/* Force SLPC to used platform rp0 */
>> +	slpc_set_param(slpc,
>> +			SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +			slpc->rp0_freq);
>> +}
>> +
>> +static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
>> +{
>> +	u32 rp_state_cap;
>> +
>> +	rp_state_cap = intel_uncore_read(slpc_to_gt(slpc)->uncore,
>> +					 GEN6_RP_STATE_CAP);
>> +
>> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
>> +					GT_FREQUENCY_MULTIPLIER;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -453,6 +557,17 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	intel_guc_pm_intrmsk_enable(&i915->gt);
>>   
>> +	slpc_get_rp_values(slpc);
>> +
>> +	/* Ignore efficient freq and set min/max to platform min/max */
>> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
>> +	intel_guc_slpc_use_fused_rp0(slpc);
>> +
>> +	ret = slpc_set_softlimits(slpc);
>> +	if (ret)
>> +		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
>> +					ERR_PTR(ret));
> 
> indent ?
> 
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> index 3cefe19b17b2..41d13527666f 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -15,6 +15,15 @@ struct intel_guc_slpc {
>>   	struct slpc_shared_data *vaddr;
>>   	bool supported;
>>   	bool selected;
>> +
>> +	/* platform frequency limits */
>> +	u32 min_freq;
>> +	u32 rp0_freq;
>> +	u32 rp1_freq;
>> +
>> +	/* frequency softlimits */
>> +	u32 min_freq_softlimit;
>> +	u32 max_freq_softlimit;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 5603377e06ca..f3a445f79a36 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -4109,6 +4109,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>>   #define BXT_GT_PERF_STATUS      _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x7070)
>>   #define GEN6_RP_STATE_LIMITS	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>>   #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
>> +#define   RP0_CAP_MASK		REG_GENMASK(7, 0)
>> +#define   RP1_CAP_MASK		REG_GENMASK(15, 8)
>> +#define   RPN_CAP_MASK		REG_GENMASK(23, 16)
>>   #define BXT_RP_STATE_CAP        _MMIO(0x138170)
>>   #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>>   
>>
