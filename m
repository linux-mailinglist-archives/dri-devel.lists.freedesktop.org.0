Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995D3D8315
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A765F6E89C;
	Tue, 27 Jul 2021 22:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB176E14D;
 Tue, 27 Jul 2021 22:36:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="234416028"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="234416028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 15:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="665650602"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2021 15:36:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 15:36:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 15:36:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 15:36:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPF9RURfKtBp9j7Rx6y6tlRot7rK1TbTDYR1etTa0suJ2v/GkXYLmLxHP8waSCuWXHYAuNrhG8oVEfQZYudENjQ5L0BN/m94b9RvIfa7g3QvgLgSIGP8cFQCOiUg81fKC1+x++6By1X+C1XxmYgf9+ZZIi8nCD7dVtf2lmW224Qf5eGG0GyLMCBWFcB6Him1ptsSfAC/1hU8fGE9EFw2h0ipK0EyOd5WbD+sOAFEWduT8SR+s5PRPD34uPIDCS9tvN6Q2J0tcZAlNyrRAyGRvlZFdR/nPLhF7UjlY/wyGr1QUN1skIxCLc9Fkk1/u2dReuLhiKims968PuDc6pmP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af1R+J8ZPrw/alK6Dmj4nVebekOeJkKs751tec4O4Qk=;
 b=J70btpsbJt2F92MxESTeQn1CJS+6ktUPVSHP3q2A2A1N0Y0ksW6+NJXqiuXzBn+jsqXFHqVpukn2Fn8wt9eahFmIjDz5e/z2L8n+ZJFQx2+TRy8LDQ0SwNnEGv3T9L+8P+F3f3IpDUxtnWsSx5aJf8xIdYs2YIztGRqO9mxd6mxZsO/Pvy3y2zBUMm+Qab3k83reFvhUZsb8Hq4zemBJedGG9iiOAiHJxPFvHJKmv18ZsIpOtletDWr0U8DMFl25dHJY6/oyWQ8qOPeOhJdAJ95n8qghl7bbgPItn31k2Tnvu68JKGszRnW7sYPYdPW5byOtdiNRJxFluwxEAU7+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af1R+J8ZPrw/alK6Dmj4nVebekOeJkKs751tec4O4Qk=;
 b=krLo2c+9Yo0JdDWqB4zWaJQD5uHApdIxY56YNTUxtKJnET6lIkPnkcpjE2VuiKhgaPgZQPP7gvlTYRHdBspGS7890gtZbNamOwjoeToiEAwZW8LwBpPNBLKzgvNjzBBo6YgF/SYxCJp3ipQH5v3NUbJnX6Yo+0TpI57SUXYPrIo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 27 Jul
 2021 22:35:30 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 22:35:30 +0000
Subject: Re: [Intel-gfx] [PATCH 08/15] drm/i915/guc/slpc: Add methods to set
 min/max frequency
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-9-vinay.belgaumkar@intel.com>
 <d1440d67-4eb1-ae41-b55e-97a2288a8564@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <20a2a6c3-d66c-c125-0464-edb189d646fd@intel.com>
Date: Tue, 27 Jul 2021 15:35:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <d1440d67-4eb1-ae41-b55e-97a2288a8564@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::11) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR13CA0066.namprd13.prod.outlook.com (2603:10b6:a03:2c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.9 via Frontend
 Transport; Tue, 27 Jul 2021 22:35:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e7e668-99e9-4b3d-29c2-08d9514ed6ff
X-MS-TrafficTypeDiagnostic: CO6PR11MB5569:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB55693337F1681DFADE7FF97885E99@CO6PR11MB5569.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44iH38Rn3CAkrma+FwhgQgJqkfF8gCIKY3xGUwZ4ctn2bxjoPAsF+L5YP2OZkfZ9G5VDNq1TT5rPrqSSA5NMU/sm0WjEJAASEj1I6m5zK7trKotlNu6FEwyXQk7mwz/aypNXa1d1pto/wrM6LVpkpMJhE5TqTyX8H8jnd87Bdvo86ZbFE/Ov7z5i0rEH1F+K72LFYuXW9HGa0cq2fesqB0htLDVV6QE1I5Lc4w4FUQ0E+mM/UZ9P2WZ74PRM6D2Hs0FOwqIN+yJTpRFHM1O6BbSFCBJ2zutZUMhIxq+3nEdRsetuT0iZnT1fROlnJV2tm0mVWgBgKFx+/cVdK51BNyMMGyuym1FibqkYOtF944TOiAarP+C2Y9sNjWZhyeo70Oua4FSDbj3nbMfw9S2pIZTPIH3JqGrre/w5rKzm/ex0w+nCfqjJY5uUrjNJx3J6M5s+De6vDgGWVPCWP3ycFjp4JUly9WEOlfKecucHkVy7vU3crm1l2ZK3dcSSsoT5AohlF+VcfUxCk0j7DNnZ9XJek7Qh+K/TpMDsfSkLyKBgPCuLCa/u2vLA0Tb+h5HbvyBYL6+JTicSp9xodHXAukAppDjfRq499LiOv4WGxYe2HkqRPp0jkusviNuG4eb3qj+2MZ8xJbHJwEAlOzmPhWQ1UGzLeyqUk2pvUpoIomOOdzB0RjBBmmWc95JW7PM6C1UooC5xQRHmKIVlnk8dJS8qXGIotn9dRF30af1ceRU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(66476007)(83380400001)(8936002)(2906002)(478600001)(31686004)(66556008)(6486002)(186003)(956004)(66946007)(16576012)(316002)(8676002)(450100002)(2616005)(38100700002)(36756003)(31696002)(86362001)(53546011)(26005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC84VFFiOU1ITWdpakxUS0d4WlVCaG0yVHowNUJ5LzRaNzA1ejJyWCtVUHpX?=
 =?utf-8?B?dCtLTWxCZitSMzAzWlRwR2xCNE93LytpUDBXczQxVS96N1M1QTI2OEFBYWNH?=
 =?utf-8?B?a3JEdUZUejg2anRiZEgrdHN1RWtnakM1ck1mbnFDWXk2TmkzSm5RREJmL2Vi?=
 =?utf-8?B?VDJjSUJURzFyZ3pPM1F3elVaNHl0ZDI5TjhUL1J6eGVFeTVoQkpYODk4ZGhJ?=
 =?utf-8?B?RUg2R0l1RE45M3N3V1dHSU1GajFxMGoxdnhobmdaM2w3R0UxZnFVazQ0Tmpk?=
 =?utf-8?B?RklvZ3dBZmR2RWpuNEhCY1dRWVNSMEVJYURoQ0U5b3NHVjFMRlRyZXQvbDFm?=
 =?utf-8?B?TWxQWklqajByN05DNmsvK25MQnhIeXJ4QnFPTDhRWWtGcnpWTThtdlpLSmVE?=
 =?utf-8?B?SXBoc2tKNEdYUUtCSE1aUit4b1lONUhTTWpVK2xiSENCWGRxUlVyVC9PTVM4?=
 =?utf-8?B?Q0wwajBKZ1JaSWdVejh4S3JsRFN1aDViRGRQVUVSako1VEhDa0FvaWVzSjZy?=
 =?utf-8?B?N1pnb05NbFU3aFlqckErallDOFlZOFFJdlhxeGh5UTVNOG5leG5wdXZ4ejNH?=
 =?utf-8?B?dlh3c1VsTDhiNGNIWW5XWlpJY0VTYjlPbHdNVWdnUk5NNVBoRDZOQ1JzenZL?=
 =?utf-8?B?WDJUNFFmSnJ5RnhEdFpySHVyNUdVS2MxQWpZZlA0UFEyV3Z0MHFYMEVGWUl2?=
 =?utf-8?B?S2cyWFROMG1ibnA1eHN4dlFTd043UjVYQndmcTRteUdqT21kNGowMDlXQnhB?=
 =?utf-8?B?c1JzaXYwZzZmSlZXeUd6cEY1bUljNlRrYlpmK2o2dHZvRjdZUGRUQzVheVhn?=
 =?utf-8?B?dXN5N3hNckU1bzUyQ2JnK3B6U0VaSkR5Tm9EZURsOTBoUlVzTHlZSG1TSkFw?=
 =?utf-8?B?dVNFWDRKUWsxOXhpL2NPWXY2cTdDa3ZLcHM3aTN2MjZONGF0UVBqNWRJWCtE?=
 =?utf-8?B?UDVJTGNPcjRwd3FzYVJKME5JM1F3UzJ2d3ZUakl2NUlEb3lvdlJGNXcwRWsv?=
 =?utf-8?B?TDduSXprc2lhMTVQZ3QrYmxSK3BOaVdCZzU3dEw2YzJVa21nbmVoVTlGYXlo?=
 =?utf-8?B?aFEyZnBjZ0FtS0s4WmtIaFlReExBL2s1U2tlNXFwWWdoaEtlRkhmVnpVNFkw?=
 =?utf-8?B?Wko3TjRoaW1zV25ONHJuVVM1THQ5dndYSEtPNmNjNEtzTlJvSzJsN2xQWmZ1?=
 =?utf-8?B?Q2NCbzFDRFVEUzBCc0JZOU5lZ1gwMzVzaFp5RWhDNlBIWFVHQWpwVnpBNmJ1?=
 =?utf-8?B?SDlkVHRZU1R4SU5PMFlsSmV5bjQ4a1Q3c21weEtObU9ZRTV2dkZVbG5ZKzF3?=
 =?utf-8?B?ejZpS21ZQmhFUmU1dG5jVlVEZWR5VkV0cWxDMzY3SGZObnU3Q0dhVHljR3Y4?=
 =?utf-8?B?QnNIMFdqaklNeWZhbnZ3ZUVEa1lYMVJ0bTBTR3gyM2RENFdZekNsQWRWOHlS?=
 =?utf-8?B?Y3l2NG5NY1lVYUJnRmdyK0lwREdRZTgrVDMvUGlQNENFUUdjRStGQTRsclVK?=
 =?utf-8?B?RkdpRWZNbmZjNVVQRiszNzNXdkk1RHdQNEhXa1RFWXZXYWh5ejdPTUM5L0Y5?=
 =?utf-8?B?VVJMMkFqV3k1SFpmTWVqaWdHemdrcE94WWFGODBjcVF5RzkvOFk0WnVTbTE0?=
 =?utf-8?B?UVhhVmFMTG5RWlBvd2xBNUszR0JlNTVHRjU0V1h2QzQ2NCtVTjNzaXUrdkJz?=
 =?utf-8?B?cU9yMmp1K2YrSDRrVkVUWTZlTkVvZ2t5Z1FFRU9DaDk0dUliQmNJaWpMYk5u?=
 =?utf-8?Q?nw7ySAo9sEvCVs1BwdC6H5bpBrqNZnzu4CL8nGt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e7e668-99e9-4b3d-29c2-08d9514ed6ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 22:35:30.7952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hxaF8AtENLn1UlPtCdbahmMMEA8jtnmRe31LWOQ6dfYnX3MFoFGM2yPEQj/Qg+LINm8d2xcJUE8milcWFukHE014ikdRbuEwUSZMwlFEwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
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



On 7/27/2021 8:24 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Add param set h2g helpers to set the min and max frequencies
> 
> s/h2g/H2G
> 
>> for use by SLPC.
>>
>> v2: Address review comments (Michal W)
>> v3: Check for positive error code (Michal W)
>>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 89 ++++++++++++++++++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 90 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index f5808d2acbca..63656640189c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -109,6 +109,21 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>>   	return data->header.global_state;
>>   }
>>   
>> +static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>> +{
>> +	u32 request[] = {
>> +		INTEL_GUC_ACTION_SLPC_REQUEST,
>> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +		id,
>> +		value,
>> +	};
>> +	int ret;
>> +
>> +	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
>> +
>> +	return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>>   static bool slpc_is_running(struct intel_guc_slpc *slpc)
>>   {
>>   	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
>> @@ -118,7 +133,7 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>>   {
>>   	u32 request[] = {
>>   		INTEL_GUC_ACTION_SLPC_REQUEST,
>> - 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>> +		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
> 
> this should be fixed in original patch

ok.

> 
>>   		offset,
>>   		0,
>>   	};
>> @@ -146,6 +161,15 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
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
>>   static const char *slpc_global_state_to_string(enum slpc_global_state state)
>>   {
>>   	const char *str = NULL;
>> @@ -251,6 +275,69 @@ static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
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
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
>> +			       val);
>> +		if (ret) {
>> +			drm_err(&i915->drm,
>> +				"Set max frequency unslice returned (%pe)\n", ERR_PTR(ret));
> 
> maybe generic error reporting could be moved to slpc_set_param() ?
> 
>> +			/* Return standardized err code for sysfs */
>> +			ret = -EIO;
> 
> at this point we don't know if this function is for sysfs only
> I would sanitize error in "store" hook if really needed

ok.

> 
> ssize_t slpc_max_freq_store(... const char *buf, size_t count)
> {
> 	...
> 	err = intel_guc_slpc_set_max_freq(slpc, val);
> 	return err ? -EIO : count;
> }
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
> 
> same here

Fixed.
Thanks,
Vinay.
> 
> Michal
> 
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index c3b0ad7f0f93..e594510497ec 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -29,5 +29,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>>   
>>   #endif
>>
