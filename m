Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAC3D83BC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 01:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68876EB3F;
	Tue, 27 Jul 2021 23:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1526E9CB;
 Tue, 27 Jul 2021 23:11:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="273625223"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="273625223"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 16:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634562779"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 27 Jul 2021 16:11:00 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 16:10:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 16:10:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 16:10:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 16:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YebkQxSAcXq+xxMsoib9mkDsN2JQy9/CSeveF63zYmiUY/SZ8o6ItBdzMpSix8/5vavj6O9QuQ1r5rXGEu96QP6By2npuXhuIHPJ76RtMZ/72WnnbhxuyV+i3G5bz9XUrbde0IEvmss+AQVBlF+diy4mn6cFcraU59reuhBGwjw03OVn+o0QgcWTssZOQTAdo/nSv1JWn35wckr810CqQrsN2t4eQr9ImCxQoEjckAoEsy7tudzvlDfA8QtDkkFIsabXx5atjI7U5wzKFgTTmYNz+NlGIg8//ityEdFbkAwel8dc2NWOCnPTZm7SPHcgtcELnjb/rTXBHbsSHdVFYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90vMUJ8MPMml0z5CoW6k4jkFDSmXqDyMn2+4Q/9BHos=;
 b=QMmElK5/tfHXkw6RRmeQqAZ7RCrdmE0gR6yUUaCMhV0eQrKvcZ24Y3Dn/UeQw5QWSiZaZEyHAJODyeiHKl9q57B4JPueS1qpS4RjdCvZwm6dbGiXkR5PGVUUhd2UNd5YC7qXTWrWrbIVqW/MnVQjpYvHfscN+yn1CBGP4L5PV3XqN4xLPeoEXZ6ARX7yrAZaw5lL5TspBTrubO4OFl8qBStK0PF6LQbRN6PLn3X4b+Qe7Diou1J089ZoLjqw4D9aAmqLFbOOtZEqkoZvYS13TF5AYKslVshzd8yIxNThR5dO1WHG6HiyYDkIYqPZfi8qrJpkOaQRxV/gRUxN0U/7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90vMUJ8MPMml0z5CoW6k4jkFDSmXqDyMn2+4Q/9BHos=;
 b=KjuyRgajASoNbs6X+swbe0vAt82BbXYQzgj6t/Gm+BMEiWudh//l6RQpdvpGBwjJTes91TzQ7FeKhol9LTZduMkFkVjZK82Enqr9UfI9OMKjdt6QFoYxQXGPLxnq4d/A3tqLdO02rfgswqHIauiU9afxqYFwoAr9aTLkxWk1geM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 23:10:58 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 23:10:58 +0000
Subject: Re: [Intel-gfx] [PATCH 09/15] drm/i915/guc/slpc: Add get max/min freq
 hooks
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-10-vinay.belgaumkar@intel.com>
 <83adc062-f5b9-5272-d99a-fa870a85328c@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <df8e4a0d-7b9c-655d-02bc-4682ff2c89cb@intel.com>
Date: Tue, 27 Jul 2021 16:10:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <83adc062-f5b9-5272-d99a-fa870a85328c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 SJ0PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:33b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.10 via Frontend
 Transport; Tue, 27 Jul 2021 23:10:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d096d1f9-9bd8-4ef2-f48b-08d95153cadf
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB5651AC5EDF876C102AC4B99385E99@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WN9/dCvZAGauCcLM5UoyQu5ynGLxOK/kYahKVf2mEft0y5w0vIz0pI2h73g6nnSEq9mMhvu3FBjU4g6AKsfHMSdOHOhtdbQAbk8975FKhTqxMm4I4iF9EjvG3oYG5ObGhkmbVLrHQLVw3HOfDNy8nhrroXhuhoG/DXoZHPZjLwpPgsnK9o9l6w1nSp8iABovqgpRv/u+0OethnkzYC85OETJtCyCpPVcm1pumXm3lHzZ3giFcdrOqsKdp79QbPt/Q2uYsTXUOM9B1wlUnXENPMq3eogxkkc5Cu4WQhUws+L0B0+ygysFHoGE8ublWgtT1APmaKBpd2ix8ft8XlqdUb+biSx2JB0YLdRm5Uyxqyi8WBaOF3Ic9Y14iodEsAxcqgt4bRK3/YTfViLoR1P9dKxPJAZAEMeHKCwFfBPRJgtmDUjbOur/0y7tsNJXByOn7WW+ZjlIUbM3T10KAgHfgrMMhjqNYr+GkfyhVDKrp/Xi+Y4k27Oh3J9iMNPZZ7oSahqGjs9AU5ANWz4djPjxC0GAcraBmZ8HcgyMa8KQJ15Qihp4L0Uo635/oe8yrL858BfutLPyRTmB5UtVqDpN5XUgqDAAcO4JbSWr0yAp9hmG9/KKGuDTmvriJ0czIU01omrGnLIfAn6XcRO6alVp5NtDT0pg7nUfxH7kOpLWFHtnX3YityYLiiB8sZ19LgUWICoPuofoF0LGbbWIA+M+B42dD5HO9HNWZJ5FEUUIv2EAl6+VWttzivK7xvKmpyFN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(53546011)(31696002)(66476007)(956004)(86362001)(66556008)(66946007)(186003)(26005)(38100700002)(2616005)(478600001)(8936002)(450100002)(83380400001)(8676002)(6486002)(31686004)(16576012)(316002)(36756003)(5660300002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFNwR08rNlVQU0JoK1g2dzBtOU1TNkFVektPbEw1VjhZVzlJVytCM2RGRi9r?=
 =?utf-8?B?cXF6MkRLNjF4SWt0YUdDQWJzZnp2b05jczV2ZWFhaVhTVDRsQXFTSUFsMWFD?=
 =?utf-8?B?NnN1L0FkU0QxTnNOWVlPZHVJSHBTUzNldjVFY3NPZndGRWYrTmkzRUltUnpL?=
 =?utf-8?B?Yit4Qy9EbXhZY29MdFZ6NmxidUM0ZkZvRkhZREZJeWc3YlBFWjNUK2ZqaS94?=
 =?utf-8?B?aGNZckIybCs4dWFzWHFzRG5wTGRpMjZrMmlnOWF3elArbDFWcEtkOEpUNXdi?=
 =?utf-8?B?UWdiTlJQaW5EN3JrM0JHSVEwRXFnU2ZnUGVYNzVtYlJNWXJNc0wrQloveWpH?=
 =?utf-8?B?UXFHYmhEOEllK3N2NWVXL3NMMzZPNnhRUkRoM3RoL2t5RDAvWnRjUUEvUkFz?=
 =?utf-8?B?WElVTC9BM2VtcmNmbmRHZytMZkRZTWFvT3hlaXBCZ2dxTUViaXFwUXV1NWRM?=
 =?utf-8?B?UXh4MUJXWlFKaERXbGxobnIxSUg5MmhIczVJL0ovVXRvaVJXTStZVThSV0sw?=
 =?utf-8?B?bUNuZlV0ZzBTYlVKaHlReXplWmNmQWtwbUtpaDV0SGtSRkl5eVpvRTcwYUVO?=
 =?utf-8?B?ODQrOXl4bGQ0YXh6MUlNWjEyQVdzaUtOZ2d2c3BsZmJZYm94M1JTYUxGOXpP?=
 =?utf-8?B?SDc3cVdPSWF2dWtjd2xjdnA0dEhTOVcvcmUrK3JhL0xWZHlVODBmUW9YeEcx?=
 =?utf-8?B?WnozYU1uVHhUK2xlZW80b2tGbllLbnc1aC9QL0NENjRTWkEvbUdzcFp5V0Ix?=
 =?utf-8?B?ZG94dlZWcnA2VGdhY0RDV0dFMy9kV01HYys4K0d1NEwzUU1YV3BuQjNJMjdv?=
 =?utf-8?B?aTJZZ1BQSjBNVktyMnVWa3BCR3lUeVJzK1VRazZkTTIwSzhUZlhRcEhsd3Iz?=
 =?utf-8?B?alljMGprT2FRODIvcEZOY1hmaG9SQUFDTkk3QWdKZ250dmliaHpRcUJoWjFL?=
 =?utf-8?B?Vm8wcktyVjVMKzVydkxuNG1KSTZYVEJWbTJNSi84RTZkbXQrQlhsRHUzNGJk?=
 =?utf-8?B?dm54R3NKTEZqdWN6ZlRDVVJzemx3R2FXWUxna1BzVjNiNXh1dmpUYmJJWTBq?=
 =?utf-8?B?d2VDQzRTTXdvaHhkbEhxcmZNakx4c1I2V0ZNdEZOSnhlL2NpSWplblRsV0Vj?=
 =?utf-8?B?SjVPR014OGRVajNzckdxY2JabSthREVyT1pXOG8ybkU1a3J6Y2JYTGFFcVdJ?=
 =?utf-8?B?a014ZUVPOUVjc0N0WnFDaFZMSG1kbGk3MVJYb2FENGw4UDR0Yk5UL3R5NFlW?=
 =?utf-8?B?aU1PRVRtRlBxV0NyMlBzUmNQYW1kZGFrWWdUQTlmMjYwQmd2ZDJnTkJ5NGlk?=
 =?utf-8?B?eXBIUzRkUmhlY09SMmVUQnFDZ09vQVM1VUlXRDJCVmhvYm9SNWVZSlIvRE1s?=
 =?utf-8?B?OVljYWhwUU9TaHdxRVdaWitBVlFSTzdWVHpxRXdBSzRLdUtuOTdkQ0ZaYkJo?=
 =?utf-8?B?YllBRFlONHpkUXl1MjVyLzRyZEZNcnFaSXcvWDMvU28xNXFYMGhhdmJZdGhZ?=
 =?utf-8?B?eWF6NGZtNlBhUzh3UEVvZ2tOZERIOXVKc0wyNHRocmZLdU52VHp3S1F5M1Rn?=
 =?utf-8?B?N0tPWHpvQ3FHOXNwSkNTSmNXQm5MSm5iZmlpb1ExTVFNUlh1YlZJWk0vWnFK?=
 =?utf-8?B?cjNSaVBwdmFyQThsNERUMThZaFFNZ3JaUEJiSzJxSHlIZ1YxTkk5d3Yybnlk?=
 =?utf-8?B?OE9QVmxTcHB2UDkyUnpnSmsrWTFvVFlDZEFQb3BKdEh6UkIrU29mWWFsdWl2?=
 =?utf-8?Q?xt1KGxiad2BeZkco/08coSmxc+GT8m5wusU4bB7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d096d1f9-9bd8-4ef2-f48b-08d95153cadf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 23:10:58.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBean/J8boO2tMyCm4/zV3rWGRe9Fuds0iUZvIUxBoh1MakfCxg263lEi7w8vG6+YqK65hc+wE1SMFnFeGHS2y0DKHOUNoV+zdW6P9aFPJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
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



On 7/27/2021 8:32 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Add helpers to read the min/max frequency being used
>> by SLPC. This is done by send a H2G command which forces
>> SLPC to update the shared data struct which can then be
>> read. These helpers will be used in a sysfs patch later
>> on.
>>
>> v2: Address review comments (Michal W)
>> v3: Return err in case of query failure (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 54 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>>   2 files changed, 56 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 63656640189c..c653bba3b5eb 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -306,6 +306,33 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_get_max_freq() - Get max frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: pointer to val which will hold max frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to read the max frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		/* Force GuC to update task data */
>> +		ret = slpc_query_task_state(slpc);
>> +
>> +		if (!ret)
>> +			*val = slpc_decode_max_freq(slpc);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -338,6 +365,33 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * intel_guc_slpc_get_min_freq() - Get min frequency limit for SLPC.
>> + * @slpc: pointer to intel_guc_slpc.
>> + * @val: pointer to val which will hold min frequency (MHz)
>> + *
>> + * This function will invoke GuC SLPC action to read the min frequency
>> + * limit for unslice.
>> + *
>> + * Return: 0 on success, non-zero error code on failure.
>> + */
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
>> +{
>> +	intel_wakeref_t wakeref;
>> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> 
> use slpc_to_i915() and in this order:
> 
> 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> 	intel_wakeref_t wakeref;
> 	int ret = 0;
> 
> with that fixed,
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

done.
Thanks,
vinay.
> 
>> +	int ret = 0;
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		/* Force GuC to update task data */
>> +		ret = slpc_query_task_state(slpc);
>> +
>> +		if (!ret)
>> +			*val = slpc_decode_min_freq(slpc);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /*
>>    * intel_guc_slpc_enable() - Start SLPC
>>    * @slpc: pointer to intel_guc_slpc.
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> index e594510497ec..92d7afd44f07 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -31,5 +31,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>>   void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>>   int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>>   int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
>> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>>   
>>   #endif
>>
